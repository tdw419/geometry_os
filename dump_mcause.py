import sys

path = "diag_run_50m.txt"
with open(path, "r") as f:
    for line in f:
        if "S->M TRAP" in line:
            print(line.strip())
