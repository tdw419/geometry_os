; DESCRIPTION: Places a yellow line segment connecting (220, 198) to (87, 174).
; PLAN: r0=220(x1), r1=198(y1), r2=87(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 198
LDI r2, 87
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
