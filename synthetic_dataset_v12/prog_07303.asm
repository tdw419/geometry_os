; DESCRIPTION: Draws a black line from (459, 2) to (234, 108).
; PLAN: r0=459(x1), r1=2(y1), r2=234(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 2
LDI r2, 234
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
