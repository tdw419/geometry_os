; DESCRIPTION: Places a red 75x74 rectangle at position (118, 40).
; PLAN: r0=118(x), r1=40(y), r2=75(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 40
LDI r2, 75
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
