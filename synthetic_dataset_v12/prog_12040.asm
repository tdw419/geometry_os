; DESCRIPTION: Renders a cyan line between points (22, 118) and (258, 188).
; PLAN: r0=22(x1), r1=118(y1), r2=258(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 118
LDI r2, 258
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
