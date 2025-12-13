import time
import argparse
from datetime import datetime
from .cvfs_daemon import CTRMVectorDaemon

def main_daemon_loop(data_dir="./cvfs_data", sleep_interval=60):
    """
    Main daemon loop for CTRM Vector File System
    """
    print(f"Starting CTRM Vector Daemon (Text File Version)")
    print(f"Data directory: {data_dir}")
    print(f"Sleep interval: {sleep_interval}s")

    daemon = CTRMVectorDaemon(data_dir)

    # Check if we have vectors, build index if we do
    vector_count = daemon._count_vectors()
    if vector_count > 100:
        print(f"Found {vector_count} vectors, building HNSW index...")
        daemon.build_hnsw_index()
        daemon.engine.vcr['hnsw_built'] = True

    cycle = 0
    try:
        while True:
            cycle += 1
            print(f"\n=== CVFS Daemon Cycle {cycle} ===")
            print(f"Time: {datetime.now().isoformat()}")

            # Run optimization cycle
            daemon.run_optimization_cycle()

            # Process any pending queries from query file
            daemon._process_pending_queries()

            # Log status
            status = {
                'cycle': cycle,
                'vectors': daemon._count_vectors(),
                'queries_processed': daemon.queries_processed,
                'hnsw_built': daemon.engine.vcr.get('hnsw_built', False)
            }
            print(f"Status: {status}")

            # Sleep until next cycle
            print(f"Sleeping for {sleep_interval} seconds...")
            time.sleep(sleep_interval)

    except KeyboardInterrupt:
        print("\nShutting down CTRM Vector Daemon...")
        # Save final state
        daemon._save_final_state()
        print("Daemon stopped.")

def main():
    # Run with: python cvfs_main.py --data-dir ./vector_data --interval 30
    parser = argparse.ArgumentParser(description='CTRM Vector File System Daemon')
    parser.add_argument('--data-dir', default='./cvfs_data', help='Data directory')
    parser.add_argument('--interval', type=int, default=60, help='Sleep interval in seconds')

    args = parser.parse_args()

    main_daemon_loop(data_dir=args.data_dir, sleep_interval=args.interval)

if __name__ == "__main__":
    main()