; DESCRIPTION: Places a magenta 24x118 rectangle at position (206, 51).
; PLAN: r0=206(x), r1=51(y), r2=24(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 51
LDI r2, 24
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
