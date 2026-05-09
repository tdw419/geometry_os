; DESCRIPTION: Renders a magenta line between points (73, 55) and (80, 40).
; PLAN: r0=73(x1), r1=55(y1), r2=80(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 55
LDI r2, 80
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
