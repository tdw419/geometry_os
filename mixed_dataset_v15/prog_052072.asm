; DESCRIPTION: Creates a blue rectangular region at (323, 32) spanning 34 by 119 pixels.
; PLAN: r0=323(x), r1=32(y), r2=34(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 32
LDI r2, 34
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
