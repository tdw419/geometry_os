; DESCRIPTION: Places a purple 67x95 rectangle at position (69, 135).
; PLAN: r0=69(x), r1=135(y), r2=67(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 135
LDI r2, 67
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
