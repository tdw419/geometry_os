; DESCRIPTION: Renders a blue line between points (189, 243) and (28, 209).
; PLAN: r0=189(x1), r1=243(y1), r2=28(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 243
LDI r2, 28
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
