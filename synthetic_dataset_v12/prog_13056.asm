; DESCRIPTION: Places a white 37x95 rectangle at position (118, 74).
; PLAN: r0=118(x), r1=74(y), r2=37(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 74
LDI r2, 37
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
