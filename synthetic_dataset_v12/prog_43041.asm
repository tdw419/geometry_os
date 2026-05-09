; DESCRIPTION: Creates a blue rectangular region at (283, 89) spanning 36 by 103 pixels.
; PLAN: r0=283(x), r1=89(y), r2=36(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 89
LDI r2, 36
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
