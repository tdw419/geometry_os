; DESCRIPTION: Draws a yellow line from (184, 237) to (474, 129).
; PLAN: r0=184(x1), r1=237(y1), r2=474(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 237
LDI r2, 474
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
