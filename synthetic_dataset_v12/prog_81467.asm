; DESCRIPTION: Draws a green line from (157, 181) to (91, 180).
; PLAN: r0=157(x1), r1=181(y1), r2=91(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 181
LDI r2, 91
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
