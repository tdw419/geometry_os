; DESCRIPTION: Renders a blue line between points (28, 130) and (151, 120).
; PLAN: r0=28(x1), r1=130(y1), r2=151(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 130
LDI r2, 151
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
