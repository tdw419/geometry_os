; DESCRIPTION: Places a white 17x63 box at position (85, 56).
; PLAN: r0=85(x), r1=56(y), r2=17(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 56
LDI r2, 17
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
