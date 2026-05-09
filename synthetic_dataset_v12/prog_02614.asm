; DESCRIPTION: Draws a yellow line from (40, 142) to (237, 234).
; PLAN: r0=40(x1), r1=142(y1), r2=237(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 142
LDI r2, 237
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
