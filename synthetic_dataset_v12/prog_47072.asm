; DESCRIPTION: Creates a purple rectangular region at (163, 139) spanning 32 by 69 pixels.
; PLAN: r0=163(x), r1=139(y), r2=32(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 139
LDI r2, 32
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
