; DESCRIPTION: Places a black 99x78 rectangle at position (89, 43).
; PLAN: r0=89(x), r1=43(y), r2=99(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 43
LDI r2, 99
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
