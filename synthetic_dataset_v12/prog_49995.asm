; DESCRIPTION: Places a black 118x74 rectangle at position (306, 72).
; PLAN: r0=306(x), r1=72(y), r2=118(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 72
LDI r2, 118
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
