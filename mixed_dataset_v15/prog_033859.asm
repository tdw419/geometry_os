; DESCRIPTION: Draws a red line from (378, 74) to (255, 147).
; PLAN: r0=378(x1), r1=74(y1), r2=255(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 74
LDI r2, 255
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
