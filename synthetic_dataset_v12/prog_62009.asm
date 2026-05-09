; DESCRIPTION: Creates a purple rectangular region at (216, 91) spanning 37 by 52 pixels.
; PLAN: r0=216(x), r1=91(y), r2=37(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 91
LDI r2, 37
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
