; DESCRIPTION: Draws a cyan line from (137, 7) to (89, 119).
; PLAN: r0=137(x1), r1=7(y1), r2=89(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 7
LDI r2, 89
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
