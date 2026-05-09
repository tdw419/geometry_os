; DESCRIPTION: Places a red 67x16 rectangle at position (114, 205).
; PLAN: r0=114(x), r1=205(y), r2=67(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 205
LDI r2, 67
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
