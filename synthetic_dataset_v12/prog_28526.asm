; DESCRIPTION: Draws a magenta line from (251, 131) to (265, 199).
; PLAN: r0=251(x1), r1=131(y1), r2=265(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 131
LDI r2, 265
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
