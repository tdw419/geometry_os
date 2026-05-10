; DESCRIPTION: Places a magenta 85x74 rectangle at position (3, 159).
; PLAN: r0=3(x), r1=159(y), r2=85(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 159
LDI r2, 85
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
