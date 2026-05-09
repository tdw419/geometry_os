; DESCRIPTION: Places a green 39x99 rectangle at position (67, 53).
; PLAN: r0=67(x), r1=53(y), r2=39(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 53
LDI r2, 39
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
