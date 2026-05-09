; DESCRIPTION: Places a red 78x74 rectangle at position (122, 10).
; PLAN: r0=122(x), r1=10(y), r2=78(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 10
LDI r2, 78
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
