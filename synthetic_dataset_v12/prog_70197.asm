; DESCRIPTION: Draws a magenta line from (35, 238) to (335, 71).
; PLAN: r0=35(x1), r1=238(y1), r2=335(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 238
LDI r2, 335
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
