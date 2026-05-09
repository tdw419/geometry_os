; DESCRIPTION: Draws a black line from (111, 129) to (236, 214).
; PLAN: r0=111(x1), r1=129(y1), r2=236(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 129
LDI r2, 236
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
