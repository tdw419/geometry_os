; DESCRIPTION: Places a magenta 93x58 rectangle at position (103, 119).
; PLAN: r0=103(x), r1=119(y), r2=93(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 119
LDI r2, 93
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
