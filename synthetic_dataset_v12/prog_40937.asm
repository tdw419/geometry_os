; DESCRIPTION: Creates a green rectangular region at (60, 105) spanning 94 by 30 pixels.
; PLAN: r0=60(x), r1=105(y), r2=94(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 105
LDI r2, 94
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
