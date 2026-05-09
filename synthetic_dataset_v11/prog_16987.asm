; DESCRIPTION: Places a green 22x107 rectangle at position (158, 2).
; PLAN: r0=158(x), r1=2(y), r2=22(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 2
LDI r2, 22
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
