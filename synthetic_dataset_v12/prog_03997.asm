; DESCRIPTION: Places a yellow 115x119 rectangle at position (89, 22).
; PLAN: r0=89(x), r1=22(y), r2=115(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 22
LDI r2, 115
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
