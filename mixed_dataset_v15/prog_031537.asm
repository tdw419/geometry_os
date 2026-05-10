; DESCRIPTION: Creates a purple rectangular region at (142, 13) spanning 69 by 52 pixels.
; PLAN: r0=142(x), r1=13(y), r2=69(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 13
LDI r2, 69
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
