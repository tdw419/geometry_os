; DESCRIPTION: Places a magenta 50x68 rectangle at position (167, 67).
; PLAN: r0=167(x), r1=67(y), r2=50(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 67
LDI r2, 50
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
