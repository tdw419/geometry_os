; DESCRIPTION: Draws a black line from (43, 234) to (340, 207).
; PLAN: r0=43(x1), r1=234(y1), r2=340(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 234
LDI r2, 340
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
