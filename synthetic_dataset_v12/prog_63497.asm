; DESCRIPTION: Creates a purple rectangular region at (374, 157) spanning 58 by 81 pixels.
; PLAN: r0=374(x), r1=157(y), r2=58(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 157
LDI r2, 58
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
