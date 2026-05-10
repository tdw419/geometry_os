; DESCRIPTION: Draws a magenta line from (251, 112) to (215, 60).
; PLAN: r0=251(x1), r1=112(y1), r2=215(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 112
LDI r2, 215
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
