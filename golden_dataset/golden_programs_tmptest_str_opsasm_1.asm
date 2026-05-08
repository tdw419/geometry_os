; DESCRIPTION: This GeOS assembly code loads a memory address into register r3, stores the string "hello" at that address, calculates the length of the stored string, and then halts execution.

LDI r3, 0x3000
STRO r3, "hello"
STRLEN r3
HALT
