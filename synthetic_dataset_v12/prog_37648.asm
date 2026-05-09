; DESCRIPTION: Places a magenta 51x101 rectangle at position (248, 75).
; PLAN: r0=248(x), r1=75(y), r2=51(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 75
LDI r2, 51
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
