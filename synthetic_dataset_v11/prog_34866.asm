; DESCRIPTION: Draws a blue line from (151, 127) to (157, 225).
; PLAN: r0=151(x1), r1=127(y1), r2=157(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 127
LDI r2, 157
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
