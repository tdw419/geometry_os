; DESCRIPTION: Draws a blue line from (249, 44) to (340, 150).
; PLAN: r0=249(x1), r1=44(y1), r2=340(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 44
LDI r2, 340
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
