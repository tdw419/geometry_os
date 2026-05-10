; DESCRIPTION: Places a black 60x35 rectangle at position (17, 140).
; PLAN: r0=17(x), r1=140(y), r2=60(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 140
LDI r2, 60
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
