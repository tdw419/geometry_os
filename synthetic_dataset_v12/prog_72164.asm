; DESCRIPTION: Draws a green line from (129, 83) to (176, 197).
; PLAN: r0=129(x1), r1=83(y1), r2=176(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 83
LDI r2, 176
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
