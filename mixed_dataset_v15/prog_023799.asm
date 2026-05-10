; DESCRIPTION: Draws a black line from (65, 22) to (264, 53).
; PLAN: r0=65(x1), r1=22(y1), r2=264(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 22
LDI r2, 264
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
