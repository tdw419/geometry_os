; DESCRIPTION: Places a purple 74x39 rectangle at position (67, 63).
; PLAN: r0=67(x), r1=63(y), r2=74(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 63
LDI r2, 74
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
