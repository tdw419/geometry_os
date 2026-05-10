; DESCRIPTION: Places a green 39x118 box at position (292, 129).
; PLAN: r0=292(x), r1=129(y), r2=39(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 129
LDI r2, 39
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
