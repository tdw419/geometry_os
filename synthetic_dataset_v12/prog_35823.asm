; DESCRIPTION: Places a yellow 22x119 rectangle at position (62, 71).
; PLAN: r0=62(x), r1=71(y), r2=22(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 71
LDI r2, 22
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
