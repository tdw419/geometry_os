; DESCRIPTION: Places a magenta 68x51 rectangle at position (427, 84).
; PLAN: r0=427(x), r1=84(y), r2=68(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 84
LDI r2, 68
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
