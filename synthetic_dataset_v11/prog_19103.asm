; DESCRIPTION: Places a magenta 100x18 rectangle at position (9, 199).
; PLAN: r0=9(x), r1=199(y), r2=100(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 199
LDI r2, 100
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
