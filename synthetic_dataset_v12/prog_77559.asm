; DESCRIPTION: Renders a purple line between points (171, 34) and (46, 225).
; PLAN: r0=171(x1), r1=34(y1), r2=46(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 34
LDI r2, 46
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
