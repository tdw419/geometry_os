; DESCRIPTION: Places a black 114x73 rectangle at position (29, 52).
; PLAN: r0=29(x), r1=52(y), r2=114(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 52
LDI r2, 114
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
