; DESCRIPTION: Draws a blue line from (340, 0) to (408, 70).
; PLAN: r0=340(x1), r1=0(y1), r2=408(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 0
LDI r2, 408
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
