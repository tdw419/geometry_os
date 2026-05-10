; DESCRIPTION: Draws a cyan line from (147, 66) to (132, 124).
; PLAN: r0=147(x1), r1=66(y1), r2=132(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 66
LDI r2, 132
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
