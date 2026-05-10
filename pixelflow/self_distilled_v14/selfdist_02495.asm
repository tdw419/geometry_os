; DESCRIPTION: Draws a blue line from (330, 71) to (6, 39).
; PLAN: r0=330(x1), r1=71(y1), r2=6(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 71
LDI r2, 6
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
