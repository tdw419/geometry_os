; DESCRIPTION: Places a magenta 25x93 rectangle at position (282, 70).
; PLAN: r0=282(x), r1=70(y), r2=25(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 70
LDI r2, 25
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
