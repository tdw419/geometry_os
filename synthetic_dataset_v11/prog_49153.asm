; DESCRIPTION: Places a magenta 118x116 rectangle at position (85, 67).
; PLAN: r0=85(x), r1=67(y), r2=118(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 67
LDI r2, 118
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
