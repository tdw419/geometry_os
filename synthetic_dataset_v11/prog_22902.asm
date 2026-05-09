; DESCRIPTION: Creates a blue rectangular region at (96, 94) spanning 30 by 112 pixels.
; PLAN: r0=96(x), r1=94(y), r2=30(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 94
LDI r2, 30
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
