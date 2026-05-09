; DESCRIPTION: Places a purple 48x67 rectangle at position (179, 78).
; PLAN: r0=179(x), r1=78(y), r2=48(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 78
LDI r2, 48
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
