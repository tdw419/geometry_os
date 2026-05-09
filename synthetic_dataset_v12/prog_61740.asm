; DESCRIPTION: Renders a black line between points (321, 121) and (279, 241).
; PLAN: r0=321(x1), r1=121(y1), r2=279(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 121
LDI r2, 279
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
