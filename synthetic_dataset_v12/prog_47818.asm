; DESCRIPTION: Places a white 80x78 rectangle at position (427, 22).
; PLAN: r0=427(x), r1=22(y), r2=80(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 22
LDI r2, 80
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
