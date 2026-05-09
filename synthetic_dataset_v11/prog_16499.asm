; DESCRIPTION: Creates a green rectangular region at (114, 8) spanning 105 by 56 pixels.
; PLAN: r0=114(x), r1=8(y), r2=105(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 8
LDI r2, 105
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
