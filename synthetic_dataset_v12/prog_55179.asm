; DESCRIPTION: Places a black 108x22 rectangle at position (349, 122).
; PLAN: r0=349(x), r1=122(y), r2=108(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 122
LDI r2, 108
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
