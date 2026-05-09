; DESCRIPTION: Creates a blue rectangular region at (402, 106) spanning 36 by 109 pixels.
; PLAN: r0=402(x), r1=106(y), r2=36(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 106
LDI r2, 36
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
