; DESCRIPTION: Draws a blue line from (114, 112) to (340, 135).
; PLAN: r0=114(x1), r1=112(y1), r2=340(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 112
LDI r2, 340
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
