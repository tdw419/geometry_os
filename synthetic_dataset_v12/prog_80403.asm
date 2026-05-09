; DESCRIPTION: Draws a black line from (294, 17) to (378, 141).
; PLAN: r0=294(x1), r1=17(y1), r2=378(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 17
LDI r2, 378
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
