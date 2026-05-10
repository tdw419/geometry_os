; DESCRIPTION: Draws a purple line from (303, 214) to (297, 243).
; PLAN: r0=303(x1), r1=214(y1), r2=297(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 214
LDI r2, 297
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
