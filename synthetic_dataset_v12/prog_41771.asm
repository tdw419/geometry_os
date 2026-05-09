; DESCRIPTION: Creates a purple rectangular region at (251, 123) spanning 95 by 66 pixels.
; PLAN: r0=251(x), r1=123(y), r2=95(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 123
LDI r2, 95
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
