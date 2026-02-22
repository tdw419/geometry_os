# Solution for Task: Validate particle system

[**Context: Change ID: add-pixi-improvement-daemon**]

1. File Paths Required/Modified:
    - **geometryos/geom_io.py**: Modify the `read_geo` function to include a check for the presence of the PIXI particle system.
      ```python
      def read_geo(filename):
        ...
        if "pixi" in filename:
          return True
        else:
          return False
      ```
    - **geometryos/geom_obj.py**: Modify the `convert_obj` function to check for the presence of the PIXI particle system and add a new option for specifying whether or not to include it.
      ```python
      def convert_obj(filename, options):
        ...
        if "pixi" in filename:
          return True
        else:
          return False
      ```

2. Code Snippet for Particle System Validation:
    - **geometryos/geom_io.py**: Add a new `validate_pixi` method that checks whether the PIXI particle system is present in the file and returns True if it is, or False otherwise.
      ```python
      def validate_pixi(filename):
        ...
        if "pixi" in filename:
          return True
        else:
          return False
      ```
    - **geometryos/geom_obj.py**: Add a new `validate_pixi` method that checks whether the PIXI particle system is present and returns True if it is, or False otherwise.
      ```python
      def validate_pixi(filename):
        ...
        if "pixi" in filename:
          return True
        else:
          return False
      ```

3. Next Step Command:
    - **geometryos/geom_io.py**: Add a new `next` command that prompts the user to select whether or not they want to include the PIXI particle system in their geometry file.
      ```python
      def next(filename):
        ...
        choice = "y" if validate_pixi(filename) else "n"
        print("Validate particle system for file:", filename)
        return choice
      ```
    - **geometryos/geom_obj.py**: Add a new `next` command that prompts the user to select whether or not they want to include the PIXI particle system in their geometry object.
      ```python
      def next(filename):
        ...
        choice = "y" if validate_pixi(filename) else "n"
        print("Validate particle system for file:", filename)
        return choice
      ```