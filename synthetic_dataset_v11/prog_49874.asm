; DESCRIPTION: Creates a purple rectangular region at (164, 20) spanning 81 by 108 pixels.
; PLAN: r0=164(x), r1=20(y), r2=81(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 20
LDI r2, 81
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
