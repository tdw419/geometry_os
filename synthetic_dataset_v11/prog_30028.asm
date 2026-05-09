; DESCRIPTION: Creates a green rectangular region at (130, 61) spanning 99 by 81 pixels.
; PLAN: r0=130(x), r1=61(y), r2=99(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 61
LDI r2, 99
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
