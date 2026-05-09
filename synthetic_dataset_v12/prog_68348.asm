; DESCRIPTION: Draws a yellow line from (85, 47) to (358, 182).
; PLAN: r0=85(x1), r1=47(y1), r2=358(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 47
LDI r2, 358
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
