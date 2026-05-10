; DESCRIPTION: Places a magenta 87x25 box at position (96, 117).
; PLAN: r0=96(x), r1=117(y), r2=87(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 117
LDI r2, 87
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
