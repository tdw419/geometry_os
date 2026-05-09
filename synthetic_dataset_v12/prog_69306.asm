; DESCRIPTION: Places a green 67x117 rectangle at position (377, 54).
; PLAN: r0=377(x), r1=54(y), r2=67(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 54
LDI r2, 67
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
