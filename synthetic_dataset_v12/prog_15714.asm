; DESCRIPTION: Places a orange 49x81 rectangle at position (179, 170).
; PLAN: r0=179(x), r1=170(y), r2=49(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 170
LDI r2, 49
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
