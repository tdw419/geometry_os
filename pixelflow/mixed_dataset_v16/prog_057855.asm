; DESCRIPTION: Places a white 57x118 rectangle at position (325, 3).
; PLAN: r0=325(x), r1=3(y), r2=57(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 3
LDI r2, 57
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
