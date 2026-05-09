; DESCRIPTION: Draws a green line from (361, 129) to (312, 197).
; PLAN: r0=361(x1), r1=129(y1), r2=312(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 129
LDI r2, 312
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
