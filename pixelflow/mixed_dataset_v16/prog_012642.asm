; DESCRIPTION: Draws a purple line from (446, 65) to (261, 92).
; PLAN: r0=446(x1), r1=65(y1), r2=261(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 65
LDI r2, 261
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
