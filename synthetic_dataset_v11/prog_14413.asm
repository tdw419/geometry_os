; DESCRIPTION: Places a magenta 79x51 rectangle at position (58, 119).
; PLAN: r0=58(x), r1=119(y), r2=79(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 119
LDI r2, 79
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
