; DESCRIPTION: Creates a blue rectangular region at (7, 139) spanning 76 by 11 pixels.
; PLAN: r0=7(x), r1=139(y), r2=76(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 139
LDI r2, 76
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
