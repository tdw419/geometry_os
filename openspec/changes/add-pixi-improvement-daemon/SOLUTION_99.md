# Solution for Task: Add cache statistics display

Title: Add Cache Statistics Display in Geometry OS Implementation Plan

Context:
The OpenSpec task is aimed to add cache statistics display to the geometryOS platform. As a Geometry OS Implementation Agent, you have been asked to provide a concise and detailed plan for how to accomplish this goal.

1. File paths required for cache statistics display:
- /var/log/cache_statistics/
- /home/user/cache_statistics_data/

2. Code snippet needed for cache statistics display:
```python
import os
from datetime import datetime, timedelta
from getopt import getopt, getargspec
import json
import psutil
import subprocess

# Function to print the cache statistics data in a readable format
def print_cache_statistics(data):
    # Initialize a dictionary with all statistics keys
    stats = {}
    
    for key in data:
        if key not in ('cpu_usage', 'mem_usage'):
            if key.startswith('swap_') and key != 'swap_usage':  # Only swap usage
                continue
            
            try:
                value = float(data[key])
                stats[key] = round(value, 2)
            except (ValueError):
                stats[key] = None
    
    # Sort the dictionary by key (sorted_keys list is already sorted)
    sorted_keys = sorted(stats.keys())
    
    # Print the statistics in a readable format
    print('Cache statistics:')
    print('-' * 30)
    for key, value in sorted_keys:
        if value is not None:  # If there are cache stats, display them
            print(f'{key}: {stats[key]} ({(data[key] / (1024 ** 6))*60.0} MB)')
    
# Main function to execute the cache statistics command
def main():
    try:
        # Parse command-line options
        opts, args = getopt(getargspec(print_cache_statistics)[0], 'hi:d:c:o:m:')
        
        if len(args) != 4:
            print('Error: Invalid number of arguments')
            return 1
        
        # Parse command-line options
        i, j, k, m = map(int, args[1:])
        
        # Get the cache statistics data file path and the cache statistics data directory path
        cache_statistics_data_path = os.path.join(args[i], 'cache_statistics_data')
        if not os.path.exists(cache_statistics_data_path):
            print('Error: Cache statistics data directory does not exist')
            return 1
        
        # Get the cache statistics data file name (without ".json")
        cache_statistics_data_file = os.path.join(args[i], f'{args[j]}.json')
        
        # Get the cache statistics data directory path and the cache statistics data filename
        if args[k] == 'd':  # Display only cache statistics
            print('Cache statistics:')
            print(f'-' * 30)
            os.system(f'ls {cache_statistics_data_path}/*.json | grep -v "__" | sort -n')
            
        elif args[k] == 'c':  # Cache statistics for a specific time (in seconds)
            try:
                # Get the cache statistics data filename and the specified time in seconds
                cache_statistics_data_file = os.path.join(cache_statistics_data_path, f'{args[j]}.json')
                
                # If the specified time is less than or equal to zero, exit with error code 1
                if int(args[k]) <= 0:
                    print('Error: Invalid cache statistics file time (must be a positive integer)')
                    return 1
                    
                # Get the specified time in seconds and convert it to milliseconds
                now = datetime.now().timestamp() * 1000
                if int(args[k]) % 1000 == 0:
                    print('Cache statistics for', now, 'seconds')
                    
                # Execute the cache statistics command and get the cache statistics data as a list of dictionaries
                subprocess.call([cache_statistics_path, cache_statistics_data_file], shell=True)
            
            except (FileNotFoundError, ValueError):
                print('Error: Cache statistics file not found')
                return 1
        
        elif args[k] == 'o':  # Output the cache statistics to a JSON file
            try:
                # Open the JSON file for writing and write the cache statistics data as a list of dictionaries
                with open(cache_statistics_data_file, 'w') as f:
                    json.dump([stats], f, indent=4)
            
            except (FileNotFoundError, ValueError):
                print('Error: JSON file not found')
                return 1
        
        else:  # Display help message and exit with error code 2
            print(f'Usage: {sys.argv[0]} [options]')
            print()
            print('Options:')
            print(f'-h, --help          Show this message')
            print(f'-i, --cache_statistics_data_path={cache_statistics_data_path}', end=' ')
            if args[k] == 'd':
                print(f' {args[j]}')  # Display only cache statistics
            else:
                print(f' {args[j]} {args[k]}')  # Cache statistics for a specific time (in seconds)
            print()
            print('-c, --cache_statistics_data_file={cache_statistics_data_file}', end=' ')
            if args[k] == 'd':  # Display cache statistics for a specific time
                print(f' {cache_statistics_data_file}')
            else:
                print(f' {args[k]}')  # Cache statistics file time (in milliseconds)
            print()
            print('-o, --output_path={output_path}', end=' ')
            if args[k] == 'd':  # Output cache statistics to a JSON file
                print(f' {args[j]}')
            else:
                print(f' {args[k]} {args[j]}')  # Cache statistics data directory path and filename
            print()
            
        return 0
    
# Call the main function
try:
    if len(sys.argv) != 3 or sys.argv[1] not in ('-h', '--help'):
        print('Error: Invalid command-line options')
        exit(2)
    
    main()
except Exception as e:
    print(f'Error: {str(e)}')
    exit(3)