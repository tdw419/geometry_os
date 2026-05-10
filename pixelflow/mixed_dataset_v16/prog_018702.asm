; DESCRIPTION: Places a black 17x13 rectangle at position (395, 230).
; PLAN: r0=395(x), r1=230(y), r2=17(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 230
LDI r2, 17
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
