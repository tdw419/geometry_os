; DESCRIPTION: Places a purple 77x12 rectangle at position (88, 130).
; PLAN: r0=88(x), r1=130(y), r2=77(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 130
LDI r2, 77
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
