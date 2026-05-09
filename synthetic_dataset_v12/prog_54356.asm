; DESCRIPTION: Draws a black line from (246, 17) to (215, 241).
; PLAN: r0=246(x1), r1=17(y1), r2=215(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 17
LDI r2, 215
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
