; DESCRIPTION: Draws a yellow line from (209, 70) to (385, 200).
; PLAN: r0=209(x1), r1=70(y1), r2=385(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 70
LDI r2, 385
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
