; DESCRIPTION: Draws a red line from (378, 180) to (231, 137).
; PLAN: r0=378(x1), r1=180(y1), r2=231(x2), r3=137(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 180
LDI r2, 231
LDI r3, 137
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
