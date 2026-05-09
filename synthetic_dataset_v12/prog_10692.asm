; DESCRIPTION: Creates a blue rectangular region at (192, 100) spanning 14 by 115 pixels.
; PLAN: r0=192(x), r1=100(y), r2=14(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 100
LDI r2, 14
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
