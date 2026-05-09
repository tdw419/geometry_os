; DESCRIPTION: Draws a cyan line from (147, 145) to (142, 48).
; PLAN: r0=147(x1), r1=145(y1), r2=142(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 145
LDI r2, 142
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
