; DESCRIPTION: Renders a black line between points (277, 52) and (92, 247).
; PLAN: r0=277(x1), r1=52(y1), r2=92(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 52
LDI r2, 92
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
