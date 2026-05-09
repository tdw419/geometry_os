; DESCRIPTION: Creates a purple rectangular region at (19, 0) spanning 109 by 34 pixels.
; PLAN: r0=19(x), r1=0(y), r2=109(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 0
LDI r2, 109
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
