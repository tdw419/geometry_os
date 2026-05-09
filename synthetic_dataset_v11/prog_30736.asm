; DESCRIPTION: Places a yellow 65x37 rectangle at position (134, 58).
; PLAN: r0=134(x), r1=58(y), r2=65(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 58
LDI r2, 65
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
