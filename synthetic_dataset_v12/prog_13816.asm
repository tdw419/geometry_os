; DESCRIPTION: Renders a yellow line between points (241, 135) and (321, 71).
; PLAN: r0=241(x1), r1=135(y1), r2=321(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 135
LDI r2, 321
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
