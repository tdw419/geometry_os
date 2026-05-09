; DESCRIPTION: Creates a purple rectangular region at (256, 158) spanning 106 by 50 pixels.
; PLAN: r0=256(x), r1=158(y), r2=106(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 158
LDI r2, 106
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
