; DESCRIPTION: Places a magenta 109x51 rectangle at position (24, 104).
; PLAN: r0=24(x), r1=104(y), r2=109(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 104
LDI r2, 109
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
