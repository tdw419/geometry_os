; DESCRIPTION: Creates a purple rectangular region at (209, 14) spanning 112 by 87 pixels.
; PLAN: r0=209(x), r1=14(y), r2=112(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 14
LDI r2, 112
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
