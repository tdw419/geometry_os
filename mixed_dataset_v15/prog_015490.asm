; DESCRIPTION: Renders a blue line segment connecting (340, 113) to (125, 19).
; PLAN: r0=340(x1), r1=113(y1), r2=125(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 113
LDI r2, 125
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
