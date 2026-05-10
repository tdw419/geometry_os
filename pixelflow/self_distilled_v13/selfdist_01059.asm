; DESCRIPTION: Places a magenta 103x118 box at position (303, 194).
; PLAN: r0=303(x), r1=194(y), r2=103(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 194
LDI r2, 103
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
