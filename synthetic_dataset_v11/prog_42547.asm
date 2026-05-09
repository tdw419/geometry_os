; DESCRIPTION: Renders a blue line between points (177, 220) and (214, 255).
; PLAN: r0=177(x1), r1=220(y1), r2=214(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 220
LDI r2, 214
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
