; DESCRIPTION: This GeOS assembly code loads a memory address into register r9, stores the string "hello" at that address, calculates the length of the stored string, and then halts execution.

LDI r9, 0x3000
STRO r9, "hello"
STRLEN r9
HALT
