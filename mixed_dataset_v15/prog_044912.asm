; DESCRIPTION: Places a black 115x101 rectangle at position (161, 130).
; PLAN: r0=161(x), r1=130(y), r2=115(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 130
LDI r2, 115
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
