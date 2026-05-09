; DESCRIPTION: Places a magenta 120x118 rectangle at position (11, 131).
; PLAN: r0=11(x), r1=131(y), r2=120(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 131
LDI r2, 120
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
