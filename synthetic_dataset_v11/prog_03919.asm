; DESCRIPTION: Draws a black line from (234, 150) to (105, 3).
; PLAN: r0=234(x1), r1=150(y1), r2=105(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 150
LDI r2, 105
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
