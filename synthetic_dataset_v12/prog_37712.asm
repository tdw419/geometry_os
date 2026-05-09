; DESCRIPTION: Renders a yellow line between points (491, 47) and (349, 71).
; PLAN: r0=491(x1), r1=47(y1), r2=349(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 47
LDI r2, 349
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
