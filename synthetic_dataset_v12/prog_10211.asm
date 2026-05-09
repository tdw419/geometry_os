; DESCRIPTION: Places a magenta 49x85 rectangle at position (81, 140).
; PLAN: r0=81(x), r1=140(y), r2=49(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 140
LDI r2, 49
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
