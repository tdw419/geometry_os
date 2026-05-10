; DESCRIPTION: Places a green 11x105 box at position (184, 150).
; PLAN: r0=184(x), r1=150(y), r2=11(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 150
LDI r2, 11
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
