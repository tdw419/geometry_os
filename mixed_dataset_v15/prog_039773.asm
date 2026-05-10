; DESCRIPTION: Draws a black line from (395, 116) to (306, 45).
; PLAN: r0=395(x1), r1=116(y1), r2=306(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 116
LDI r2, 306
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
