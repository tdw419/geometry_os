; DESCRIPTION: Draws a green line from (177, 202) to (55, 2).
; PLAN: r0=177(x1), r1=202(y1), r2=55(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 202
LDI r2, 55
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
