; DESCRIPTION: Draws a red line from (378, 250) to (388, 184).
; PLAN: r0=378(x1), r1=250(y1), r2=388(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 250
LDI r2, 388
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
