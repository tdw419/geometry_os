; DESCRIPTION: Creates a purple rectangular region at (167, 62) spanning 62 by 13 pixels.
; PLAN: r0=167(x), r1=62(y), r2=62(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 62
LDI r2, 62
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
