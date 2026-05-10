; DESCRIPTION: Renders a magenta line segment connecting (293, 188) to (125, 190).
; PLAN: r0=293(x1), r1=188(y1), r2=125(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 188
LDI r2, 125
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
