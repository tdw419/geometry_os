; DESCRIPTION: Draws a cyan line from (311, 156) to (395, 118).
; PLAN: r0=311(x1), r1=156(y1), r2=395(x2), r3=118(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 156
LDI r2, 395
LDI r3, 118
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
