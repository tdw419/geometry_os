; DESCRIPTION: Draws a blue line from (147, 239) to (302, 182).
; PLAN: r0=147(x1), r1=239(y1), r2=302(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 239
LDI r2, 302
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
