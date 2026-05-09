; DESCRIPTION: Places a black 89x39 rectangle at position (18, 217).
; PLAN: r0=18(x), r1=217(y), r2=89(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 217
LDI r2, 89
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
