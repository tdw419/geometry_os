; DESCRIPTION: Draws a magenta line from (358, 55) to (292, 72).
; PLAN: r0=358(x1), r1=55(y1), r2=292(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 55
LDI r2, 292
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
