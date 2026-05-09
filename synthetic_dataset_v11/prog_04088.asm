; DESCRIPTION: Places a yellow 118x71 rectangle at position (137, 67).
; PLAN: r0=137(x), r1=67(y), r2=118(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 67
LDI r2, 118
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
