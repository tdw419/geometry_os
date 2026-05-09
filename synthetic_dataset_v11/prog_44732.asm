; DESCRIPTION: Renders a magenta line between points (21, 219) and (246, 200).
; PLAN: r0=21(x1), r1=219(y1), r2=246(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 219
LDI r2, 246
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
