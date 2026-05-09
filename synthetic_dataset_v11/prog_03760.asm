; DESCRIPTION: Draws a yellow line from (131, 147) to (218, 108).
; PLAN: r0=131(x1), r1=147(y1), r2=218(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 147
LDI r2, 218
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
