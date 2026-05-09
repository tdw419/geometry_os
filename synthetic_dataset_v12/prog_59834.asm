; DESCRIPTION: Places a black 23x95 rectangle at position (455, 43).
; PLAN: r0=455(x), r1=43(y), r2=23(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 43
LDI r2, 23
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
