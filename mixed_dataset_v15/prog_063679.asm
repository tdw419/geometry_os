; DESCRIPTION: Draws a magenta line from (91, 17) to (148, 195).
; PLAN: r0=91(x1), r1=17(y1), r2=148(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 17
LDI r2, 148
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
