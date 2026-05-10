; DESCRIPTION: Places a magenta 52x43 box at position (253, 11).
; PLAN: r0=253(x), r1=11(y), r2=52(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 11
LDI r2, 52
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
