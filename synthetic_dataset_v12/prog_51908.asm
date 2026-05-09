; DESCRIPTION: Draws a black line from (391, 221) to (220, 106).
; PLAN: r0=391(x1), r1=221(y1), r2=220(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 221
LDI r2, 220
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
