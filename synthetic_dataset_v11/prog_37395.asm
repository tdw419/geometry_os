; DESCRIPTION: Creates a purple rectangular region at (151, 3) spanning 69 by 23 pixels.
; PLAN: r0=151(x), r1=3(y), r2=69(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 3
LDI r2, 69
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
