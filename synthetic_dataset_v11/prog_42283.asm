; DESCRIPTION: Renders a magenta line between points (111, 60) and (130, 105).
; PLAN: r0=111(x1), r1=60(y1), r2=130(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 60
LDI r2, 130
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
