; DESCRIPTION: Places a magenta 100x22 rectangle at position (21, 30).
; PLAN: r0=21(x), r1=30(y), r2=100(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 30
LDI r2, 100
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
