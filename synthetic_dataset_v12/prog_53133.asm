; DESCRIPTION: Draws a magenta line from (349, 83) to (34, 6).
; PLAN: r0=349(x1), r1=83(y1), r2=34(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 83
LDI r2, 34
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
