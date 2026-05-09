; DESCRIPTION: Draws a cyan line from (270, 155) to (297, 77).
; PLAN: r0=270(x1), r1=155(y1), r2=297(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 155
LDI r2, 297
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
