; DESCRIPTION: Creates a green rectangular region at (99, 9) spanning 72 by 11 pixels.
; PLAN: r0=99(x), r1=9(y), r2=72(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 9
LDI r2, 72
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
