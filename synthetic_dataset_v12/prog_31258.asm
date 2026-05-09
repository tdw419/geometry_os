; DESCRIPTION: Renders a blue line between points (19, 237) and (28, 196).
; PLAN: r0=19(x1), r1=237(y1), r2=28(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 237
LDI r2, 28
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
