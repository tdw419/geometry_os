; DESCRIPTION: Places a yellow 89x19 rectangle at position (258, 129).
; PLAN: r0=258(x), r1=129(y), r2=89(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 129
LDI r2, 89
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
