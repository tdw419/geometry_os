; DESCRIPTION: Places a yellow 114x84 rectangle at position (44, 67).
; PLAN: r0=44(x), r1=67(y), r2=114(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 67
LDI r2, 114
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
