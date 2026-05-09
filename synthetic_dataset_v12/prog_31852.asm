; DESCRIPTION: Creates a purple rectangular region at (19, 2) spanning 103 by 48 pixels.
; PLAN: r0=19(x), r1=2(y), r2=103(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 2
LDI r2, 103
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
