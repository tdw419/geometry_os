; DESCRIPTION: Places a magenta 53x27 rectangle at position (435, 67).
; PLAN: r0=435(x), r1=67(y), r2=53(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 67
LDI r2, 53
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
