; DESCRIPTION: Draws a black line from (66, 176) to (306, 253).
; PLAN: r0=66(x1), r1=176(y1), r2=306(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 176
LDI r2, 306
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
