; DESCRIPTION: Places a green 78x99 rectangle at position (158, 106).
; PLAN: r0=158(x), r1=106(y), r2=78(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 106
LDI r2, 78
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
