; DESCRIPTION: Draws a black line from (222, 234) to (226, 152).
; PLAN: r0=222(x1), r1=234(y1), r2=226(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 234
LDI r2, 226
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
