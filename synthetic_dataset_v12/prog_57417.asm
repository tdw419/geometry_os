; DESCRIPTION: Places a red 34x114 rectangle at position (409, 3).
; PLAN: r0=409(x), r1=3(y), r2=34(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 3
LDI r2, 34
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
