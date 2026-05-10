; DESCRIPTION: Places a red 56x43 box at position (192, 63).
; PLAN: r0=192(x), r1=63(y), r2=56(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 63
LDI r2, 56
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
