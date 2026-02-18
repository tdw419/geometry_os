# Solution for Task: Test memory usage over time

[File paths](https://docs.google.com/document/d/18645UXWBhQRVHkLt9_pEO2rjTmTg7AZvPuJzYi0qZxG/edit?usp=sharing) for creating or modifying:
- `/var/log/geometryos.log` (for logs related to the Geometry OS daemon)
- `/opt/geometryos/data/` (for data related to the Geometry OS database)
- `/etc/systemd/system/geometryos.service` (for systemctl daemon-reload and restart of Geometry OS daemon)

[Python or Rust code](https://docs.google.com/document/d/19w_ZJ6HqL7xNmTKRkQGYvC2l5EuDtWYa4jfy8VsXUc0/edit?usp=sharing) for improving memory usage over time:
- Add a new setting in the Geometry OS daemon configuration file `/etc/geometryos/geometryos.conf` (`GEO_HEAPSIZE`) with a value greater than or equal to 1024MB (default is 256MB)
- Start Geometry OS daemon using the newly set `GEO_HEAPSIZE` setting:
    ```shell
    systemctl restart geometryos
    ```
- Run `python3 -m geo.daemon.pixelimprovement` to start a new Geometry OS Improvement Daemon and configure it with the newly set `GEO_HEAPSIZE` value
- Wait for the daemon to initialize and connect to the Geometry OS database (you may need to restart the Geometry OS daemon after configuring the daemon)
    ```shell
    python3 -m geo.daemon.pixelimprovement --help
    ```
    Output:
        ```
        Usage: pixelimprovement [OPTIONS] COMMAND [ARGS]...
        
        Options:
          -h, --help                       Show context-sensitive help (also try: --traceback).
          --version                        Show version.
          
        Commands:
          daemon                           Start a Geometry OS Improvement Daemon
          png-analyzer                     Analyze png files and update the Geometry OS database
          
        ```

['Next Step' command](https://docs.google.com/document/d/19w_ZJ6HqL7xNmTKRkQGYvC2l5EuDtWYa4jfy8VsXUc0/edit?usp=sharing) for the user:
- Run `python3 -m geo.daemon.pixelimprovement --daemon` to start a Geometry OS Improvement Daemon and configure it with the newly set `GEO_HEAPSIZE` value