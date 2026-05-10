; DESCRIPTION: Creates a purple rectangular region at (9, 60) spanning 71 by 66 pixels.
; PLAN: r0=9(x), r1=60(y), r2=71(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 60
LDI r2, 71
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
