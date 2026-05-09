; DESCRIPTION: Places a red 69x87 rectangle at position (64, 67).
; PLAN: r0=64(x), r1=67(y), r2=69(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 67
LDI r2, 69
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
