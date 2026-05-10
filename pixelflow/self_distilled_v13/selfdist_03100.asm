; DESCRIPTION: Places a magenta 17x74 box at position (193, 6).
; PLAN: r0=193(x), r1=6(y), r2=17(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 6
LDI r2, 17
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
