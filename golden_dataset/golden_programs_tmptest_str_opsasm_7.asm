; DESCRIPTION: This GeOS assembly code loads a memory address into register r11, stores the string "hello" at that address, calculates the length of the stored string, and then halts execution.

LDI r11, 0x3000
STRO r11, "hello"
STRLEN r11
HALT
