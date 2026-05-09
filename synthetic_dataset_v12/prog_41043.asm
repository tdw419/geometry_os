; DESCRIPTION: Creates a blue rectangular region at (41, 144) spanning 94 by 66 pixels.
; PLAN: r0=41(x), r1=144(y), r2=94(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 144
LDI r2, 94
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
