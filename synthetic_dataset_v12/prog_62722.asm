; DESCRIPTION: Creates a purple rectangular region at (358, 53) spanning 44 by 116 pixels.
; PLAN: r0=358(x), r1=53(y), r2=44(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 53
LDI r2, 44
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
