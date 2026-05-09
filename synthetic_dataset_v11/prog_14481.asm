; DESCRIPTION: Places a black 37x98 rectangle at position (5, 122).
; PLAN: r0=5(x), r1=122(y), r2=37(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 122
LDI r2, 37
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
