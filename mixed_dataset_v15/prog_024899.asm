; DESCRIPTION: Draws a blue line from (182, 25) to (208, 202).
; PLAN: r0=182(x1), r1=25(y1), r2=208(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 25
LDI r2, 208
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
