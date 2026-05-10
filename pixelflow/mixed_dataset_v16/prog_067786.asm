; DESCRIPTION: Creates a blue rectangular region at (145, 120) spanning 31 by 101 pixels.
; PLAN: r0=145(x), r1=120(y), r2=31(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 120
LDI r2, 31
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
