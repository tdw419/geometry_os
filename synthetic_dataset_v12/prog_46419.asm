; DESCRIPTION: Draws a yellow line from (260, 230) to (421, 123).
; PLAN: r0=260(x1), r1=230(y1), r2=421(x2), r3=123(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 230
LDI r2, 421
LDI r3, 123
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
