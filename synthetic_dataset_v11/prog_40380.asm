; DESCRIPTION: Draws a magenta line from (20, 69) to (170, 225).
; PLAN: r0=20(x1), r1=69(y1), r2=170(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 69
LDI r2, 170
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
