; DESCRIPTION: Draws a black line from (237, 200) to (2, 197).
; PLAN: r0=237(x1), r1=200(y1), r2=2(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 200
LDI r2, 2
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
