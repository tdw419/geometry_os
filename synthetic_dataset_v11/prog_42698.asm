; DESCRIPTION: Creates a purple rectangular region at (90, 103) spanning 102 by 81 pixels.
; PLAN: r0=90(x), r1=103(y), r2=102(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 103
LDI r2, 102
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
