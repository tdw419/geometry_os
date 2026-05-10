; DESCRIPTION: Places a blue 69x67 rectangle at position (304, 177).
; PLAN: r0=304(x), r1=177(y), r2=69(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 177
LDI r2, 69
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
