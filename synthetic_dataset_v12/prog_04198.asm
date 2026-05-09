; DESCRIPTION: Draws a black line from (237, 222) to (139, 249).
; PLAN: r0=237(x1), r1=222(y1), r2=139(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 222
LDI r2, 139
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
