; DESCRIPTION: Draws a cyan line from (71, 208) to (77, 147).
; PLAN: r0=71(x1), r1=208(y1), r2=77(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 208
LDI r2, 77
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
