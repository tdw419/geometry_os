; DESCRIPTION: Draws a blue line from (274, 130) to (199, 63).
; PLAN: r0=274(x1), r1=130(y1), r2=199(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 130
LDI r2, 199
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
