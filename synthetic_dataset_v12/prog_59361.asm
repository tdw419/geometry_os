; DESCRIPTION: Creates a purple rectangular region at (252, 30) spanning 17 by 35 pixels.
; PLAN: r0=252(x), r1=30(y), r2=17(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 30
LDI r2, 17
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
