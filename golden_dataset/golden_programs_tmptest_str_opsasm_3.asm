; DESCRIPTION: Draws a red object at the screen with fixed size.

LDI r11, 0x3000
STRO r11, "hello"
STRLEN r11
HALT
