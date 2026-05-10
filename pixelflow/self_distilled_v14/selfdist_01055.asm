; DESCRIPTION: Places a red 107x118 box at position (366, 112).
; PLAN: r0=366(x), r1=112(y), r2=107(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 112
LDI r2, 107
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
