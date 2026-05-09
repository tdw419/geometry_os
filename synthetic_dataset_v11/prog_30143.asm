; DESCRIPTION: Draws a magenta line from (46, 103) to (19, 17).
; PLAN: r0=46(x1), r1=103(y1), r2=19(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 103
LDI r2, 19
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
