; DESCRIPTION: Draws a yellow line from (73, 165) to (438, 202).
; PLAN: r0=73(x1), r1=165(y1), r2=438(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 165
LDI r2, 438
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
