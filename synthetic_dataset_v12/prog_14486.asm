; DESCRIPTION: Creates a green rectangular region at (148, 73) spanning 97 by 75 pixels.
; PLAN: r0=148(x), r1=73(y), r2=97(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 73
LDI r2, 97
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
