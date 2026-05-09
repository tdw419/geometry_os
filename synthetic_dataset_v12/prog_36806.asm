; DESCRIPTION: Places a yellow 67x88 rectangle at position (206, 165).
; PLAN: r0=206(x), r1=165(y), r2=67(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 165
LDI r2, 67
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
