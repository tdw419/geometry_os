; DESCRIPTION: Creates a purple rectangular region at (6, 128) spanning 107 by 115 pixels.
; PLAN: r0=6(x), r1=128(y), r2=107(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 128
LDI r2, 107
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
