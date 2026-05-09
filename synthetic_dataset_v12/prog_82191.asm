; DESCRIPTION: Places a white 78x99 rectangle at position (316, 118).
; PLAN: r0=316(x), r1=118(y), r2=78(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 118
LDI r2, 78
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
