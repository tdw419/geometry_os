; DESCRIPTION: Draws a black line from (122, 150) to (214, 122).
; PLAN: r0=122(x1), r1=150(y1), r2=214(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 150
LDI r2, 214
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
