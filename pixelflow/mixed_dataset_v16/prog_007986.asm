; DESCRIPTION: Renders a purple line between points (171, 178) and (225, 233).
; PLAN: r0=171(x1), r1=178(y1), r2=225(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 178
LDI r2, 225
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
