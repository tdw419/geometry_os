; DESCRIPTION: Places a magenta 72x114 rectangle at position (52, 20).
; PLAN: r0=52(x), r1=20(y), r2=72(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 20
LDI r2, 72
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
