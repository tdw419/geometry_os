; DESCRIPTION: Draws a black line from (194, 174) to (37, 195).
; PLAN: r0=194(x1), r1=174(y1), r2=37(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 174
LDI r2, 37
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
