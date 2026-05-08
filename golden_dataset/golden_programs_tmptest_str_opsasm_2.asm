; DESCRIPTION: This GeOS assembly code loads a memory address into register r6, stores the string "hello" at that address, calculates the length of the stored string, and then halts execution.

LDI r6, 0x3000
STRO r6, "hello"
STRLEN r6
HALT
