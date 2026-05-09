; DESCRIPTION: Creates a yellow rectangular region at (389, 29) spanning 63 by 118 pixels.
; PLAN: r0=389(x), r1=29(y), r2=63(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 29
LDI r2, 63
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
