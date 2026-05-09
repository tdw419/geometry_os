; DESCRIPTION: Creates a purple rectangular region at (40, 72) spanning 112 by 74 pixels.
; PLAN: r0=40(x), r1=72(y), r2=112(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 72
LDI r2, 112
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
