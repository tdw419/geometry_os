; DESCRIPTION: Renders a blue line between points (44, 54) and (217, 236).
; PLAN: r0=44(x1), r1=54(y1), r2=217(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 54
LDI r2, 217
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
