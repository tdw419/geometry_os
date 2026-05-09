; DESCRIPTION: Creates a blue rectangular region at (34, 87) spanning 43 by 36 pixels.
; PLAN: r0=34(x), r1=87(y), r2=43(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 87
LDI r2, 43
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
