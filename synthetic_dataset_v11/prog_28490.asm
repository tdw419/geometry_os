; DESCRIPTION: Draws a magenta line from (159, 200) to (203, 193).
; PLAN: r0=159(x1), r1=200(y1), r2=203(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 200
LDI r2, 203
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
