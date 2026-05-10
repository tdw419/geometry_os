; DESCRIPTION: Draws a blue line from (358, 24) to (146, 132).
; PLAN: r0=358(x1), r1=24(y1), r2=146(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 24
LDI r2, 146
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
