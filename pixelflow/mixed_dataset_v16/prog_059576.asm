; DESCRIPTION: Creates a purple rectangular region at (264, 157) spanning 119 by 68 pixels.
; PLAN: r0=264(x), r1=157(y), r2=119(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 157
LDI r2, 119
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
