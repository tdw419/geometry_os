; DESCRIPTION: Places a black 114x54 rectangle at position (22, 54).
; PLAN: r0=22(x), r1=54(y), r2=114(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 54
LDI r2, 114
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
