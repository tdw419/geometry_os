; DESCRIPTION: Creates a purple rectangular region at (1, 109) spanning 112 by 116 pixels.
; PLAN: r0=1(x), r1=109(y), r2=112(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 109
LDI r2, 112
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
