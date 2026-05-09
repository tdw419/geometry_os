; DESCRIPTION: Renders a green line between points (71, 218) and (186, 240).
; PLAN: r0=71(x1), r1=218(y1), r2=186(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 218
LDI r2, 186
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
