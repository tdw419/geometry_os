; DESCRIPTION: Places a red 67x14 rectangle at position (377, 225).
; PLAN: r0=377(x), r1=225(y), r2=67(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 225
LDI r2, 67
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
