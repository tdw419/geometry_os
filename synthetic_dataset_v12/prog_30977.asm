; DESCRIPTION: Places a black 73x24 rectangle at position (155, 138).
; PLAN: r0=155(x), r1=138(y), r2=73(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 138
LDI r2, 73
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
