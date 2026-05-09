; DESCRIPTION: Places a white 17x101 rectangle at position (325, 85).
; PLAN: r0=325(x), r1=85(y), r2=17(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 85
LDI r2, 17
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
