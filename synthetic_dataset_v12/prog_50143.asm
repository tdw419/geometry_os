; DESCRIPTION: Places a red 74x84 rectangle at position (390, 3).
; PLAN: r0=390(x), r1=3(y), r2=74(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 3
LDI r2, 74
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
