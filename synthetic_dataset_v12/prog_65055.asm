; DESCRIPTION: Creates a purple rectangular region at (119, 73) spanning 103 by 20 pixels.
; PLAN: r0=119(x), r1=73(y), r2=103(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 73
LDI r2, 103
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
