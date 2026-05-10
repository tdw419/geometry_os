; DESCRIPTION: Draws a yellow line from (139, 147) to (294, 50).
; PLAN: r0=139(x1), r1=147(y1), r2=294(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 147
LDI r2, 294
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
