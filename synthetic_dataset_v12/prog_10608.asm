; DESCRIPTION: Draws a cyan line from (94, 147) to (204, 2).
; PLAN: r0=94(x1), r1=147(y1), r2=204(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 147
LDI r2, 204
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
