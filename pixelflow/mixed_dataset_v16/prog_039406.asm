; DESCRIPTION: Places a yellow 80x18 box at position (325, 198).
; PLAN: r0=325(x), r1=198(y), r2=80(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 198
LDI r2, 80
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
