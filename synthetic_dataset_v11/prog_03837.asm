; DESCRIPTION: Draws a blue line from (243, 246) to (251, 159).
; PLAN: r0=243(x1), r1=246(y1), r2=251(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 246
LDI r2, 251
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
