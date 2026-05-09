; DESCRIPTION: Places a yellow 23x54 rectangle at position (107, 67).
; PLAN: r0=107(x), r1=67(y), r2=23(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 67
LDI r2, 23
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
