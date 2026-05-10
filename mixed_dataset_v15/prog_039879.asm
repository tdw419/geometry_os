; DESCRIPTION: Draws a black line from (260, 71) to (285, 36).
; PLAN: r0=260(x1), r1=71(y1), r2=285(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 71
LDI r2, 285
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
