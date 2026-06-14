savedcmd_palace.mod := printf '%s\n'   palace.o | awk '!x[$$0]++ { print("./"$$0) }' > palace.mod
