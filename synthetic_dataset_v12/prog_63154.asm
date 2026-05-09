; DESCRIPTION: Draws a cyan line from (22, 118) to (399, 137).
; PLAN: r0=22(x1), r1=118(y1), r2=399(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 118
LDI r2, 399
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
