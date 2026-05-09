; DESCRIPTION: Renders a yellow line between points (335, 229) and (415, 223).
; PLAN: r0=335(x1), r1=229(y1), r2=415(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 229
LDI r2, 415
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
