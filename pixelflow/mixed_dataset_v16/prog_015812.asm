; DESCRIPTION: Creates a blue rectangular region at (396, 5) spanning 114 by 94 pixels.
; PLAN: r0=396(x), r1=5(y), r2=114(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 5
LDI r2, 114
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
