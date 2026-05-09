; DESCRIPTION: Creates a blue rectangular region at (115, 34) spanning 63 by 63 pixels.
; PLAN: r0=115(x), r1=34(y), r2=63(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 34
LDI r2, 63
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
