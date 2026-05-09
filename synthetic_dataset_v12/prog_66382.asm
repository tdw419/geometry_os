; DESCRIPTION: Places a purple 18x118 rectangle at position (69, 93).
; PLAN: r0=69(x), r1=93(y), r2=18(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 93
LDI r2, 18
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
