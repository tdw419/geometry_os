; DESCRIPTION: Creates a purple rectangular region at (105, 195) spanning 101 by 49 pixels.
; PLAN: r0=105(x), r1=195(y), r2=101(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 195
LDI r2, 101
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
