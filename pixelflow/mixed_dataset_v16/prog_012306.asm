; DESCRIPTION: Renders a purple rectangular region spanning 97 by 29 at (276, 116).
; PLAN: r0=276(x), r1=116(y), r2=97(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 116
LDI r2, 97
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
