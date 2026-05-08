; DESCRIPTION: This GeOS assembly code loads a memory address into register r13, stores the string "hello" at that address, calculates the length of the stored string, and then halts execution.

LDI r13, 0x3000
STRO r13, "hello"
STRLEN r13
HALT
