; DESCRIPTION: Creates a blue rectangular region at (278, 35) spanning 74 by 66 pixels.
; PLAN: r0=278(x), r1=35(y), r2=74(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 35
LDI r2, 74
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
