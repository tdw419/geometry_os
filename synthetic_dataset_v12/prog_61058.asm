; DESCRIPTION: Renders a magenta line between points (243, 130) and (285, 96).
; PLAN: r0=243(x1), r1=130(y1), r2=285(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 130
LDI r2, 285
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
