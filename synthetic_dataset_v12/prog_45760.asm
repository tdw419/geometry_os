; DESCRIPTION: Creates a green rectangular region at (74, 35) spanning 106 by 32 pixels.
; PLAN: r0=74(x), r1=35(y), r2=106(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 35
LDI r2, 106
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
