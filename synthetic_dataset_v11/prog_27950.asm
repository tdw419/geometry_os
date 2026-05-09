; DESCRIPTION: Draws a black line from (85, 214) to (175, 181).
; PLAN: r0=85(x1), r1=214(y1), r2=175(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 214
LDI r2, 175
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
