; DESCRIPTION: Creates a purple rectangular region at (30, 183) spanning 80 by 58 pixels.
; PLAN: r0=30(x), r1=183(y), r2=80(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 183
LDI r2, 80
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
