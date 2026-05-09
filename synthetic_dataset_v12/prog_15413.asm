; DESCRIPTION: Creates a green rectangular region at (216, 142) spanning 15 by 33 pixels.
; PLAN: r0=216(x), r1=142(y), r2=15(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 142
LDI r2, 15
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
