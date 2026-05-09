; DESCRIPTION: Creates a purple rectangular region at (119, 24) spanning 21 by 54 pixels.
; PLAN: r0=119(x), r1=24(y), r2=21(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 24
LDI r2, 21
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
