; DESCRIPTION: Creates a blue rectangular region at (134, 0) spanning 97 by 85 pixels.
; PLAN: r0=134(x), r1=0(y), r2=97(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 0
LDI r2, 97
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
