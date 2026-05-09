; DESCRIPTION: Renders a blue line between points (66, 28) and (214, 59).
; PLAN: r0=66(x1), r1=28(y1), r2=214(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 28
LDI r2, 214
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
