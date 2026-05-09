; DESCRIPTION: Draws a green line from (172, 147) to (176, 83).
; PLAN: r0=172(x1), r1=147(y1), r2=176(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 147
LDI r2, 176
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
