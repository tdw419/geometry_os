; DESCRIPTION: Creates a purple rectangular region at (128, 166) spanning 81 by 89 pixels.
; PLAN: r0=128(x), r1=166(y), r2=81(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 166
LDI r2, 81
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
