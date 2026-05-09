; DESCRIPTION: Places a yellow 82x101 rectangle at position (17, 110).
; PLAN: r0=17(x), r1=110(y), r2=82(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 110
LDI r2, 82
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
