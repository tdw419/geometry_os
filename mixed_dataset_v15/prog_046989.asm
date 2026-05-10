; DESCRIPTION: Draws a cyan line from (266, 87) to (147, 177).
; PLAN: r0=266(x1), r1=87(y1), r2=147(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 87
LDI r2, 147
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
