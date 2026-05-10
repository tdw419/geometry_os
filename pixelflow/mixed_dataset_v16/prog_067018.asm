; DESCRIPTION: Places a magenta 10x107 box at position (265, 2).
; PLAN: r0=265(x), r1=2(y), r2=10(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 2
LDI r2, 10
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
