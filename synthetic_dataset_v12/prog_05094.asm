; DESCRIPTION: Draws a yellow line from (237, 1) to (396, 254).
; PLAN: r0=237(x1), r1=1(y1), r2=396(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 1
LDI r2, 396
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
