; DESCRIPTION: Places a red 74x49 rectangle at position (77, 145).
; PLAN: r0=77(x), r1=145(y), r2=74(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 145
LDI r2, 74
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
