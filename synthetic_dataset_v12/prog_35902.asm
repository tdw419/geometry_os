; DESCRIPTION: Renders a black line between points (47, 188) and (108, 241).
; PLAN: r0=47(x1), r1=188(y1), r2=108(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 188
LDI r2, 108
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
