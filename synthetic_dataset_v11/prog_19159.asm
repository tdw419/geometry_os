; DESCRIPTION: Draws a blue line from (140, 226) to (249, 240).
; PLAN: r0=140(x1), r1=226(y1), r2=249(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 226
LDI r2, 249
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
