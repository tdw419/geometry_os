; DESCRIPTION: Draws a purple line from (21, 178) to (349, 209).
; PLAN: r0=21(x1), r1=178(y1), r2=349(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 178
LDI r2, 349
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
