; DESCRIPTION: Draws a cyan line from (191, 155) to (471, 89).
; PLAN: r0=191(x1), r1=155(y1), r2=471(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 155
LDI r2, 471
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
