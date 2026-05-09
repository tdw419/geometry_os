; DESCRIPTION: Places a magenta 20x81 rectangle at position (448, 115).
; PLAN: r0=448(x), r1=115(y), r2=20(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 115
LDI r2, 20
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
