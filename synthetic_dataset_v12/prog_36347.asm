; DESCRIPTION: Renders a black line between points (36, 25) and (409, 60).
; PLAN: r0=36(x1), r1=25(y1), r2=409(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 25
LDI r2, 409
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
