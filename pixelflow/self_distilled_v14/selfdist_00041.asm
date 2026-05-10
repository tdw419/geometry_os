; DESCRIPTION: Places a magenta 35x67 box at position (20, 3).
; PLAN: r0=20(x), r1=3(y), r2=35(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 3
LDI r2, 35
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
