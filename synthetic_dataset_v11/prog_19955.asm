; DESCRIPTION: Creates a purple rectangular region at (87, 112) spanning 11 by 114 pixels.
; PLAN: r0=87(x), r1=112(y), r2=11(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 112
LDI r2, 11
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
