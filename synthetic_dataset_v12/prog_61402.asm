; DESCRIPTION: Renders a purple line between points (266, 225) and (218, 174).
; PLAN: r0=266(x1), r1=225(y1), r2=218(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 225
LDI r2, 218
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
