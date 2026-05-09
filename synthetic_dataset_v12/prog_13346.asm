; DESCRIPTION: Renders a purple line between points (285, 225) and (303, 253).
; PLAN: r0=285(x1), r1=225(y1), r2=303(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 225
LDI r2, 303
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
