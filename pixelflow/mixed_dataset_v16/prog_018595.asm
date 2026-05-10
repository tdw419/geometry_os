; DESCRIPTION: Creates a purple rectangular region at (141, 100) spanning 32 by 23 pixels.
; PLAN: r0=141(x), r1=100(y), r2=32(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 100
LDI r2, 32
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
