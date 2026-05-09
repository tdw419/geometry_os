; DESCRIPTION: Places a yellow 13x67 rectangle at position (104, 170).
; PLAN: r0=104(x), r1=170(y), r2=13(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 170
LDI r2, 13
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
