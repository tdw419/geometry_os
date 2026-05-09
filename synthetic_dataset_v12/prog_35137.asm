; DESCRIPTION: Renders a purple line between points (129, 149) and (171, 249).
; PLAN: r0=129(x1), r1=149(y1), r2=171(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 149
LDI r2, 171
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
