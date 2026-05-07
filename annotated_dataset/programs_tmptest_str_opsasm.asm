; DESCRIPTION: This GeOS assembly code loads a memory address into register r1, stores the string "hello" at that address, calculates the length of the stored string, and then halts execution.

LDI r1, 0x3000
STRO r1, "hello"
STRLEN r1
HALT
