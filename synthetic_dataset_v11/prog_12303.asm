; DESCRIPTION: Places a black 81x26 rectangle at position (147, 34).
; PLAN: r0=147(x), r1=34(y), r2=81(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 34
LDI r2, 81
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
