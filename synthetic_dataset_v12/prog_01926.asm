; DESCRIPTION: Places a magenta 81x112 rectangle at position (212, 75).
; PLAN: r0=212(x), r1=75(y), r2=81(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 75
LDI r2, 81
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
