; DESCRIPTION: Draws a purple line from (39, 71) to (350, 174).
; PLAN: r0=39(x1), r1=71(y1), r2=350(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 71
LDI r2, 350
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
