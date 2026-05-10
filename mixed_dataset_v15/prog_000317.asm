; DESCRIPTION: Draws a magenta line from (393, 17) to (187, 131).
; PLAN: r0=393(x1), r1=17(y1), r2=187(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 17
LDI r2, 187
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
