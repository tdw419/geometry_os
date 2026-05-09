; DESCRIPTION: Draws a black line from (430, 28) to (391, 45).
; PLAN: r0=430(x1), r1=28(y1), r2=391(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 28
LDI r2, 391
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
