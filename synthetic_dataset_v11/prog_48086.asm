; DESCRIPTION: Creates a green rectangular region at (7, 164) spanning 14 by 23 pixels.
; PLAN: r0=7(x), r1=164(y), r2=14(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 164
LDI r2, 14
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
