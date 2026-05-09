; DESCRIPTION: Draws a black line from (161, 160) to (45, 182).
; PLAN: r0=161(x1), r1=160(y1), r2=45(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 160
LDI r2, 45
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
