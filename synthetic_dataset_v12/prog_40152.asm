; DESCRIPTION: Creates a green rectangular region at (164, 89) spanning 23 by 96 pixels.
; PLAN: r0=164(x), r1=89(y), r2=23(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 89
LDI r2, 23
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
