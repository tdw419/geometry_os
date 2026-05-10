; DESCRIPTION: Places a magenta 77x105 rectangle at position (377, 63).
; PLAN: r0=377(x), r1=63(y), r2=77(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 63
LDI r2, 77
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
