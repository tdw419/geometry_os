; DESCRIPTION: Creates a purple rectangular region at (234, 15) spanning 10 by 49 pixels.
; PLAN: r0=234(x), r1=15(y), r2=10(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 15
LDI r2, 10
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
