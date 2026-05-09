; DESCRIPTION: Draws a cyan line from (426, 140) to (311, 158).
; PLAN: r0=426(x1), r1=140(y1), r2=311(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 140
LDI r2, 311
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
