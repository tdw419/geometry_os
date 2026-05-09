; DESCRIPTION: Creates a blue rectangular region at (89, 157) spanning 28 by 94 pixels.
; PLAN: r0=89(x), r1=157(y), r2=28(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 157
LDI r2, 28
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
