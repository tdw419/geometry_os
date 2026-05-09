; DESCRIPTION: Places a white 88x118 rectangle at position (332, 18).
; PLAN: r0=332(x), r1=18(y), r2=88(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 18
LDI r2, 88
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
