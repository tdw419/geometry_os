# Solution for Task: Add connection state events

### Context:
The Geometry OS Implementation Agent is tasked with providing a concise implementation plan or code solution for the following OpenSpec task:

Add connection state events

### Task:
Change ID: add-compositor-integration-daemon

Task:
Add connection state events to the Geometry OS compositor integration daemon.

1. File paths that need to be created or modified:
   - `geom_compositor_input_data.json`: A JSON file containing the compositor's input data.
   - `geom_compositor_output_data.json`: A JSON file containing the compositor's output data.

2. Snippet of Python or Rust code required:
   ```python
   from geocompositor import CompositorInputData, CompositorOutputData

   # Create an instance of CompositorInputData class
   input_data = CompositorInputData()
   
   # Add the compositor's connection state (e.g. Input/output devices)
   input_device_name = "HDMI1"
   input_state = {
       "isActive": True,
       "isConnected": True
   }
   input_data.add_input_device(input_device_name, input_state)
   
   # Add the compositor's output devices (e.g. Screens/renderers)
   output_device_name = "FlatPanel"
   output_state = {
       "isActive": True,
       "isConnected": True
   }
   output_data = CompositorOutputData(output_device_name, output_state)
   input_data.add_output_device(output_device_name, output_data)
   
   # Save the compositor's configuration to JSON file
   with open("geom_compositor_input_data.json", "w") as f:
       json.dump(input_data, f)
   ```
   ```rust
   use geocompositor::*;
   
   // Create an instance of CompositorInputData class
   let mut input_data = CompositorInputData::default();
   
   // Add the compositor's connection state (e.g. Input/output devices)
   let input_device_name = "HDMI1";
   let input_state = {
       "isActive": true,
       "isConnected": true
   };
   let input_data = CompositorInputData::add_input_device(input_device_name, input_state);
   
   // Add the compositor's output devices (e.g. Screens/renderers)
   let mut output_devices = vec!["FlatPanel".to_string()];
   for device in &output_devices {
       let output_device_name = device;
       let output_state = {
           "isActive": true,
           "isConnected": true
       };
       let output_data = CompositorOutputData(output_device_name, output_state);
       input_data.add_output_device(output_device_name, output_data);
   }
   
   // Save the compositor's configuration to JSON file
   let mut input_data_file = String::new();
   {
       let f = File::create("geom_compositor_input_data.json").unwrap();
       let mut writer = BufWriter::new(f);
       let json_str = serde_json::to_string(&input_data).unwrap();
       writer.write_all(json_str.as_bytes()).unwrap();
   }
   
   // Save the compositor's configuration to JSON file
   let mut output_data_file = String::new();
   {
       let f = File::create("geom_compositor_output_data.json").unwrap();
       let mut writer = BufWriter::new(f);
       let json_str = serde_json::to_string(&input_data).unwrap();
       writer.write_all(json_str.as_bytes()).unwrap();
   }
   
   ```

3. Next Step command for the user:
   - Create a file named `geom_compositor_output_data.json` in the same directory as the Geometry OS application.
   - Save the JSON configuration of the compositor output data to this file.

### Conclusion:
The above implementation plan provides a concise and clear code solution for adding connection state events to the Geometry OS compositor integration daemon. The changes are expected to be implemented by the Geometry OS Implementation Agent and tested thoroughly before being released into official Geometry OS releases.