; DESCRIPTION: Creates a purple rectangular region at (175, 22) spanning 28 by 20 pixels.
; PLAN: r0=175(x), r1=22(y), r2=28(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 22
LDI r2, 28
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
