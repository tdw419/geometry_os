; DESCRIPTION: Places a black 89x49 rectangle at position (122, 87).
; PLAN: r0=122(x), r1=87(y), r2=89(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 87
LDI r2, 89
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
