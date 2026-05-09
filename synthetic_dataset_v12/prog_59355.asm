; DESCRIPTION: Places a yellow 104x84 rectangle at position (67, 25).
; PLAN: r0=67(x), r1=25(y), r2=104(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 25
LDI r2, 104
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
