; DESCRIPTION: Renders a purple line between points (342, 151) and (313, 208).
; PLAN: r0=342(x1), r1=151(y1), r2=313(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 151
LDI r2, 313
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
