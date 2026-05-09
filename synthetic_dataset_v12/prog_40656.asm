; DESCRIPTION: Renders a black line between points (489, 176) and (262, 7).
; PLAN: r0=489(x1), r1=176(y1), r2=262(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 176
LDI r2, 262
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
