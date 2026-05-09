; DESCRIPTION: Draws a purple line from (486, 209) to (121, 146).
; PLAN: r0=486(x1), r1=209(y1), r2=121(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 209
LDI r2, 121
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
