; DESCRIPTION: Creates a purple rectangular region at (34, 119) spanning 104 by 111 pixels.
; PLAN: r0=34(x), r1=119(y), r2=104(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 119
LDI r2, 104
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
