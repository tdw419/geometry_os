savedcmd_geometry_os.mod := printf '%s\n'   main.o | awk '!x[$$0]++ { print("./"$$0) }' > geometry_os.mod
