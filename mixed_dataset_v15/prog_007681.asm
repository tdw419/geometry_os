; DESCRIPTION: Places a yellow 110x78 rectangle at position (287, 140).
; PLAN: r0=287(x), r1=140(y), r2=110(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 140
LDI r2, 110
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
