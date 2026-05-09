; DESCRIPTION: Creates a purple rectangular region at (76, 181) spanning 53 by 48 pixels.
; PLAN: r0=76(x), r1=181(y), r2=53(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 181
LDI r2, 53
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
