; DESCRIPTION: Creates a purple rectangular region at (315, 81) spanning 12 by 114 pixels.
; PLAN: r0=315(x), r1=81(y), r2=12(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 81
LDI r2, 12
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
