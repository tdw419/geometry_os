; DESCRIPTION: Places a red 88x74 rectangle at position (118, 0).
; PLAN: r0=118(x), r1=0(y), r2=88(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 0
LDI r2, 88
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
