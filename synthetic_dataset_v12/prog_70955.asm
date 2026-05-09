; DESCRIPTION: Draws a magenta line from (170, 19) to (52, 137).
; PLAN: r0=170(x1), r1=19(y1), r2=52(x2), r3=137(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 19
LDI r2, 52
LDI r3, 137
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
