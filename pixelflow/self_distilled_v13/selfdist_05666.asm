; DESCRIPTION: Places a magenta 74x89 box at position (27, 197).
; PLAN: r0=27(x), r1=197(y), r2=74(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 197
LDI r2, 74
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
