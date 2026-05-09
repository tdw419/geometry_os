; DESCRIPTION: Draws a yellow line from (400, 6) to (83, 71).
; PLAN: r0=400(x1), r1=6(y1), r2=83(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 6
LDI r2, 83
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
