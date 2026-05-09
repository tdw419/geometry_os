; DESCRIPTION: Places a blue 67x49 rectangle at position (181, 195).
; PLAN: r0=181(x), r1=195(y), r2=67(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 195
LDI r2, 67
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
