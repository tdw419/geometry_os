; DESCRIPTION: Draws a black line from (130, 30) to (373, 36).
; PLAN: r0=130(x1), r1=30(y1), r2=373(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 30
LDI r2, 373
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
