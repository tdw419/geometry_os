; DESCRIPTION: Renders a blue line between points (460, 65) and (214, 153).
; PLAN: r0=460(x1), r1=65(y1), r2=214(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 65
LDI r2, 214
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
