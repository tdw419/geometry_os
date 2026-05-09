; DESCRIPTION: Creates a green rectangular region at (60, 99) spanning 48 by 105 pixels.
; PLAN: r0=60(x), r1=99(y), r2=48(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 99
LDI r2, 48
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
