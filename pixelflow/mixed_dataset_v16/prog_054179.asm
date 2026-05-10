; DESCRIPTION: Creates a purple rectangular region at (150, 128) spanning 83 by 51 pixels.
; PLAN: r0=150(x), r1=128(y), r2=83(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 128
LDI r2, 83
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
