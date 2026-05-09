; DESCRIPTION: Draws a yellow line from (300, 180) to (453, 24).
; PLAN: r0=300(x1), r1=180(y1), r2=453(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 180
LDI r2, 453
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
