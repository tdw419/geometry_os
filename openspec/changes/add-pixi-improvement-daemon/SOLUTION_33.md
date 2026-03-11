# Solution for Task: Add configuration for cycle duration

[Context: Geometry OS Implementation Agent]
Your goal is to provide a concise and detailed implementation plan or code solution for the following OpenSpec task. Change ID: add-pixi-improvement-daemon, task: Add configuration for cycle duration.

1. File paths that need to be created or modified:
    - `config_path`: directory where Geometry OS will save its config files (e.g., `/var/lib/geometryos`).
    - `cycle_duration`: directory where Geometry OS will create and store cycle duration data (e.g., `/tmp/cycles`).

2. A brief snippet of the Python or Rust code required:
    ```python
    from geometry_os import config, system
    
    def create_config(config_path: str):
        return {
            'cycle_duration': {
                'days': 10,
                'hours': 12,
                'minutes': 60,
                'seconds': 45,
                'timezone': 'America/New_York',
            },
        }
    
    def run(config: config.Config):
        with system.lock():
            config['cycle_duration']['days'] = 365 * int(config['cycle_duration']['days'])
            config['cycle_duration']['hours'] = int(config['cycle_duration']['hours'])
            config['cycle_duration']['minutes'] = int(config['cycle_duration']['minutes'])
            config['cycle_duration']['seconds'] = int(config['cycle_duration']['seconds'])
    
    if __name__ == '__main__':
        with config.load(create_config):
            run()
    ```

3. A 'Next Step' command for the user (e.g. create a file, run a script):
    ```bash
    $ python3 geometryos-impovement.py create_config /var/lib/geometryos/config.yaml
    ```