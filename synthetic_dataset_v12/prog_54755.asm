; DESCRIPTION: Places a magenta 78x72 rectangle at position (316, 13).
; PLAN: r0=316(x), r1=13(y), r2=78(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 13
LDI r2, 78
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
