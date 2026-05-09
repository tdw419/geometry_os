; DESCRIPTION: Places a green 74x101 rectangle at position (395, 90).
; PLAN: r0=395(x), r1=90(y), r2=74(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 90
LDI r2, 74
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
