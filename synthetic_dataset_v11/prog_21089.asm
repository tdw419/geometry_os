; DESCRIPTION: Places a black 20x93 rectangle at position (49, 108).
; PLAN: r0=49(x), r1=108(y), r2=20(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 108
LDI r2, 20
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
