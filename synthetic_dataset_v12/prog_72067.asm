; DESCRIPTION: Places a red 67x34 rectangle at position (424, 85).
; PLAN: r0=424(x), r1=85(y), r2=67(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 85
LDI r2, 67
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
