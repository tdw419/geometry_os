; DESCRIPTION: Creates a purple rectangular region at (382, 64) spanning 58 by 26 pixels.
; PLAN: r0=382(x), r1=64(y), r2=58(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 64
LDI r2, 58
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
