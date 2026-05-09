; DESCRIPTION: Places a white 20x118 rectangle at position (407, 21).
; PLAN: r0=407(x), r1=21(y), r2=20(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 21
LDI r2, 20
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
