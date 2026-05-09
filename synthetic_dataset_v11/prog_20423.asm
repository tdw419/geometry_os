; DESCRIPTION: Places a black 17x119 rectangle at position (162, 102).
; PLAN: r0=162(x), r1=102(y), r2=17(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 102
LDI r2, 17
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
