; DESCRIPTION: Draws a black line from (43, 226) to (104, 76).
; PLAN: r0=43(x1), r1=226(y1), r2=104(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 226
LDI r2, 104
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
