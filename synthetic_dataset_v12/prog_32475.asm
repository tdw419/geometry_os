; DESCRIPTION: Creates a purple rectangular region at (253, 220) spanning 89 by 14 pixels.
; PLAN: r0=253(x), r1=220(y), r2=89(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 220
LDI r2, 89
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
