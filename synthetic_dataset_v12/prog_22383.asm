; DESCRIPTION: Places a magenta 86x74 rectangle at position (201, 73).
; PLAN: r0=201(x), r1=73(y), r2=86(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 73
LDI r2, 86
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
