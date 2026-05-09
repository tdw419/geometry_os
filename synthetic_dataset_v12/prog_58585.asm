; DESCRIPTION: Draws a yellow line from (261, 223) to (335, 253).
; PLAN: r0=261(x1), r1=223(y1), r2=335(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 223
LDI r2, 335
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
