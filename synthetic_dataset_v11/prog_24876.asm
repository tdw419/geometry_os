; DESCRIPTION: Places a magenta 26x94 rectangle at position (66, 17).
; PLAN: r0=66(x), r1=17(y), r2=26(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 17
LDI r2, 26
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
