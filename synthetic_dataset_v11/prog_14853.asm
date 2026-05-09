; DESCRIPTION: Creates a purple rectangular region at (101, 188) spanning 30 by 32 pixels.
; PLAN: r0=101(x), r1=188(y), r2=30(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 188
LDI r2, 30
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
