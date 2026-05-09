; DESCRIPTION: Places a magenta 51x106 rectangle at position (200, 56).
; PLAN: r0=200(x), r1=56(y), r2=51(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 56
LDI r2, 51
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
