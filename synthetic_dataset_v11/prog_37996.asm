; DESCRIPTION: Draws a magenta line from (83, 175) to (91, 159).
; PLAN: r0=83(x1), r1=175(y1), r2=91(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 175
LDI r2, 91
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
