; DESCRIPTION: Places a magenta 38x54 rectangle at position (316, 67).
; PLAN: r0=316(x), r1=67(y), r2=38(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 67
LDI r2, 38
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
