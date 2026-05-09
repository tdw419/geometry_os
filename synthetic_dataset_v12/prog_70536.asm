; DESCRIPTION: Places a green 11x106 rectangle at position (457, 63).
; PLAN: r0=457(x), r1=63(y), r2=11(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 63
LDI r2, 11
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
