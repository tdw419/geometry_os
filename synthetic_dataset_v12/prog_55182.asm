; DESCRIPTION: Renders a magenta line between points (387, 181) and (310, 105).
; PLAN: r0=387(x1), r1=181(y1), r2=310(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 181
LDI r2, 310
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
