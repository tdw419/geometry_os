; DESCRIPTION: Creates a blue rectangular region at (363, 172) spanning 26 by 34 pixels.
; PLAN: r0=363(x), r1=172(y), r2=26(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 172
LDI r2, 26
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
