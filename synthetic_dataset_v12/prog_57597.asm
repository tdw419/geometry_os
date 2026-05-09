; DESCRIPTION: Places a black 11x89 rectangle at position (108, 159).
; PLAN: r0=108(x), r1=159(y), r2=11(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 159
LDI r2, 11
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
