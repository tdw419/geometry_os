# Tasks: Calibration Phase

- [x] **Infrastructure**
  - [x] Create `systems/calibration` directory
  - [x] Implement `systems/calibration/injector.py`
  - [x] Implement `systems/calibration/patterns.py` (The emotional vectors)

- [x] **Harness**
  - [x] Create `run_calibration.sh`
    - [x] Kills existing daemon
    - [x] Starts Compositor in background
    - [x] Starts Injector
    - [x] Cycles through emotions (5s each)

- [x] **Verification**
  - [x] Verify `PANIC` produces Red output (Log check)
  - [x] Verify `FLOW` produces Cyan output
  - [x] Verify manual visual check (Look at the screen/window)
