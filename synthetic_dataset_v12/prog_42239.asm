; DESCRIPTION: Creates a magenta rectangular region at (216, 99) spanning 68 by 65 pixels.
; PLAN: r0=216(x), r1=99(y), r2=68(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 99
LDI r2, 68
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
