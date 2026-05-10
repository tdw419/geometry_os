; DESCRIPTION: Draws a black line from (80, 69) to (391, 187).
; PLAN: r0=80(x1), r1=69(y1), r2=391(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 69
LDI r2, 391
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
