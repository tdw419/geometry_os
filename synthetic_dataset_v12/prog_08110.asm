; DESCRIPTION: Places a black 20x15 rectangle at position (158, 220).
; PLAN: r0=158(x), r1=220(y), r2=20(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 220
LDI r2, 20
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
