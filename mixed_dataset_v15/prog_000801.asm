; DESCRIPTION: Renders a blue line between points (415, 45) and (186, 21).
; PLAN: r0=415(x1), r1=45(y1), r2=186(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 45
LDI r2, 186
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
