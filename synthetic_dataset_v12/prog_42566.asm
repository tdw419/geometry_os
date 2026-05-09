; DESCRIPTION: Creates a purple rectangular region at (403, 101) spanning 89 by 13 pixels.
; PLAN: r0=403(x), r1=101(y), r2=89(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 101
LDI r2, 89
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
