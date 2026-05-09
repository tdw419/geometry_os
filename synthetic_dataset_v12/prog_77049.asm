; DESCRIPTION: Places a magenta 113x53 rectangle at position (221, 67).
; PLAN: r0=221(x), r1=67(y), r2=113(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 67
LDI r2, 113
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
