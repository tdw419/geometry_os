; DESCRIPTION: Creates a green rectangular region at (216, 71) spanning 25 by 15 pixels.
; PLAN: r0=216(x), r1=71(y), r2=25(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 71
LDI r2, 25
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
