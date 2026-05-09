; DESCRIPTION: Creates a blue rectangular region at (181, 89) spanning 32 by 94 pixels.
; PLAN: r0=181(x), r1=89(y), r2=32(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 89
LDI r2, 32
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
