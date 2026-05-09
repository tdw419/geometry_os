; DESCRIPTION: Places a yellow 117x36 rectangle at position (67, 129).
; PLAN: r0=67(x), r1=129(y), r2=117(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 129
LDI r2, 117
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
