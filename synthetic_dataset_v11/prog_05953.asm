; DESCRIPTION: Draws a magenta line from (114, 47) to (160, 251).
; PLAN: r0=114(x1), r1=47(y1), r2=160(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 47
LDI r2, 160
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
