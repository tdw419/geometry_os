; DESCRIPTION: Renders a magenta line between points (7, 234) and (117, 105).
; PLAN: r0=7(x1), r1=234(y1), r2=117(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 234
LDI r2, 117
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
