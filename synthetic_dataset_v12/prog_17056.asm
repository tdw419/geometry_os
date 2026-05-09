; DESCRIPTION: Draws a green line from (147, 58) to (218, 182).
; PLAN: r0=147(x1), r1=58(y1), r2=218(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 58
LDI r2, 218
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
