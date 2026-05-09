; DESCRIPTION: Creates a white rectangular region at (160, 99) spanning 89 by 88 pixels.
; PLAN: r0=160(x), r1=99(y), r2=89(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 99
LDI r2, 89
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
