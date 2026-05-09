; DESCRIPTION: Renders a magenta line between points (105, 223) and (200, 117).
; PLAN: r0=105(x1), r1=223(y1), r2=200(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 223
LDI r2, 200
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
