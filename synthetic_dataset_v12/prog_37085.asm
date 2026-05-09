; DESCRIPTION: Places a black 18x108 rectangle at position (106, 66).
; PLAN: r0=106(x), r1=66(y), r2=18(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 66
LDI r2, 18
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
