; DESCRIPTION: Places a yellow 11x97 rectangle at position (147, 53).
; PLAN: r0=147(x), r1=53(y), r2=11(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 53
LDI r2, 11
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
