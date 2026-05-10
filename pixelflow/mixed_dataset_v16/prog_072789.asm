; DESCRIPTION: Draws a black line from (298, 169) to (192, 137).
; PLAN: r0=298(x1), r1=169(y1), r2=192(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 169
LDI r2, 192
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
