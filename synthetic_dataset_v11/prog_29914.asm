; DESCRIPTION: Places a magenta 74x68 rectangle at position (113, 47).
; PLAN: r0=113(x), r1=47(y), r2=74(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 47
LDI r2, 74
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
