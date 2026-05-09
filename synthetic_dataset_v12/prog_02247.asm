; DESCRIPTION: Places a magenta 52x100 rectangle at position (230, 114).
; PLAN: r0=230(x), r1=114(y), r2=52(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 114
LDI r2, 52
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
