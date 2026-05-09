; DESCRIPTION: Places a magenta 86x56 rectangle at position (316, 88).
; PLAN: r0=316(x), r1=88(y), r2=86(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 88
LDI r2, 86
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
