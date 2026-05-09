; DESCRIPTION: Renders a black line between points (378, 57) and (283, 198).
; PLAN: r0=378(x1), r1=57(y1), r2=283(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 57
LDI r2, 283
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
