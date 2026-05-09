; DESCRIPTION: Creates a blue rectangular region at (99, 1) spanning 28 by 115 pixels.
; PLAN: r0=99(x), r1=1(y), r2=28(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 1
LDI r2, 28
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
