; DESCRIPTION: Draws a black line from (368, 206) to (248, 225).
; PLAN: r0=368(x1), r1=206(y1), r2=248(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 206
LDI r2, 248
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
