; DESCRIPTION: Places a orange 49x15 rectangle at position (204, 118).
; PLAN: r0=204(x), r1=118(y), r2=49(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 118
LDI r2, 49
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
