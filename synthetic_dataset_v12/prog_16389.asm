; DESCRIPTION: Places a magenta 81x20 rectangle at position (44, 183).
; PLAN: r0=44(x), r1=183(y), r2=81(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 183
LDI r2, 81
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
