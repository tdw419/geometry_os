; DESCRIPTION: Places a black 81x26 rectangle at position (105, 158).
; PLAN: r0=105(x), r1=158(y), r2=81(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 158
LDI r2, 81
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
