; DESCRIPTION: Creates a purple rectangular region at (22, 13) spanning 58 by 85 pixels.
; PLAN: r0=22(x), r1=13(y), r2=58(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 13
LDI r2, 58
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
