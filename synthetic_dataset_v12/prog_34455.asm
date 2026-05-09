; DESCRIPTION: Renders a purple line between points (243, 164) and (174, 92).
; PLAN: r0=243(x1), r1=164(y1), r2=174(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 164
LDI r2, 174
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
