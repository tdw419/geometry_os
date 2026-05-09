; DESCRIPTION: Places a black 89x24 rectangle at position (121, 232).
; PLAN: r0=121(x), r1=232(y), r2=89(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 232
LDI r2, 89
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
