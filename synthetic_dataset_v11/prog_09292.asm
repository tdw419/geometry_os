; DESCRIPTION: Draws a yellow line from (78, 236) to (69, 254).
; PLAN: r0=78(x1), r1=236(y1), r2=69(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 236
LDI r2, 69
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
