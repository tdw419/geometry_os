; DESCRIPTION: Places a magenta 69x43 rectangle at position (352, 67).
; PLAN: r0=352(x), r1=67(y), r2=69(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 67
LDI r2, 69
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
