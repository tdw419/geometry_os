; DESCRIPTION: Places a magenta 60x12 rectangle at position (74, 33).
; PLAN: r0=74(x), r1=33(y), r2=60(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 33
LDI r2, 60
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
