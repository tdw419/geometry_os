; DESCRIPTION: Places a red 108x49 rectangle at position (67, 153).
; PLAN: r0=67(x), r1=153(y), r2=108(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 153
LDI r2, 108
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
