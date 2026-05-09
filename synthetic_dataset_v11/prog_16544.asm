; DESCRIPTION: Creates a blue rectangular region at (64, 36) spanning 119 by 66 pixels.
; PLAN: r0=64(x), r1=36(y), r2=119(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 36
LDI r2, 119
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
