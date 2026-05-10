; DESCRIPTION: Places a orange 81x118 box at position (247, 103).
; PLAN: r0=247(x), r1=103(y), r2=81(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 103
LDI r2, 81
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
