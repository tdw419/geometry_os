; DESCRIPTION: Draws a yellow line from (40, 80) to (392, 193).
; PLAN: r0=40(x1), r1=80(y1), r2=392(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 80
LDI r2, 392
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
