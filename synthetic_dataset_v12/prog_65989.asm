; DESCRIPTION: Draws a blue line from (392, 65) to (300, 73).
; PLAN: r0=392(x1), r1=65(y1), r2=300(x2), r3=73(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 65
LDI r2, 300
LDI r3, 73
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
