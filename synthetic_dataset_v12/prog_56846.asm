; DESCRIPTION: Creates a purple rectangular region at (463, 122) spanning 32 by 82 pixels.
; PLAN: r0=463(x), r1=122(y), r2=32(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 122
LDI r2, 32
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
