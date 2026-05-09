; DESCRIPTION: Places a magenta 73x56 rectangle at position (297, 100).
; PLAN: r0=297(x), r1=100(y), r2=73(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 100
LDI r2, 73
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
