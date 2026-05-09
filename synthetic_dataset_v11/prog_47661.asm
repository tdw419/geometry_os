; DESCRIPTION: Renders a magenta line between points (17, 163) and (160, 76).
; PLAN: r0=17(x1), r1=163(y1), r2=160(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 163
LDI r2, 160
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
