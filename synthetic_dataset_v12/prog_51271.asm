; DESCRIPTION: Creates a green rectangular region at (435, 49) spanning 23 by 89 pixels.
; PLAN: r0=435(x), r1=49(y), r2=23(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 49
LDI r2, 23
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
