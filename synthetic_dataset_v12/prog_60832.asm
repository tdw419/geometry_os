; DESCRIPTION: Places a yellow 53x37 rectangle at position (11, 160).
; PLAN: r0=11(x), r1=160(y), r2=53(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 160
LDI r2, 53
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
