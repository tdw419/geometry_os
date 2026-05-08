; DESCRIPTION: This GeOS assembly code loads a memory address into register r12, stores the string "hello" at that address, calculates the length of the stored string, and then halts execution.

LDI r12, 0x3000
STRO r12, "hello"
STRLEN r12
HALT
