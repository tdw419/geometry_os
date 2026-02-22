# Solution for Task: Add transition duration configuration

Title: Add Transition Duration Configuration

Task: Change ID: add-pixi-improvement-daemon

Context: Geometry OS Implementation Task

Goal: Provide a concise implementation plan or code solution for the following OpenSpec task.

Step 1: File Paths Required and Modified

The following file paths need to be created or modified in order to configure the transition duration of objects within Geometry OS:
- `osm_data/pixi_objects.json`
- `osm_data/pixi_user_settings.json`

Step 2: Python or Rust Code Required

A brief snippet of Python or Rust code is required to configure the transition duration for objects within Geometry OS using the following steps:

1. Create a new object file, such as `.osm_data/pixi_objects.json` in your OSM data directory.
2. Add a `transitionDuration` field to this file with a value of 0 (no transition).
3. Save and close the object file.
4. Create a new user settings file, such as `.osm_data/pixi_user_settings.json` in your OSM data directory.
5. Add a `transitionDuration` field to this file with a value of 0 (no transition).
6. Save and close the user settings file.
7. Restart Geometry OS using the following command: `osm -u`.

Step 3: Next Step Command for the User (e.g. Create a File, Run Script)

A 'Next Step' command is required for the user to configure the transition duration of objects within Geometry OS. This can be done by creating a file in the OSM data directory with a name matching the `transitionDuration` field and providing a value of 0 (no transition). For example:
```
# osm_data/pixi_objects.json
{
    "id": "aabbccddee",
    "type": "object",
    "transitionDuration": 0, # no transition
}
```

Conclusion

With these file paths and code requirements, you can add a configuration option to configure the transition duration of objects within Geometry OS. The next step is to create a new object file with a `transitionDuration` value of 0 (no transition) in order for objects to continue moving smoothly on their journey. Once this is done, save and close the object file using the command `osm -u`. Restart Geometry OS using the 'osm' command to apply the changes and test the functionality of the objects.