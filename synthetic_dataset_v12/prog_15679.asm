; DESCRIPTION: Places a black 58x49 rectangle at position (136, 158).
; PLAN: r0=136(x), r1=158(y), r2=58(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 158
LDI r2, 58
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
