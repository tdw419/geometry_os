; DESCRIPTION: Renders a cyan line between points (84, 236) and (4, 147).
; PLAN: r0=84(x1), r1=236(y1), r2=4(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 236
LDI r2, 4
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
