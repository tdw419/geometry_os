; DESCRIPTION: Draws a black line from (137, 190) to (208, 255).
; PLAN: r0=137(x1), r1=190(y1), r2=208(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 190
LDI r2, 208
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
