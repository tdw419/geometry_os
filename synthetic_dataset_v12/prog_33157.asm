; DESCRIPTION: Places a yellow 37x11 rectangle at position (13, 145).
; PLAN: r0=13(x), r1=145(y), r2=37(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 145
LDI r2, 37
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
