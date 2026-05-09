; DESCRIPTION: Draws a yellow line from (296, 129) to (92, 239).
; PLAN: r0=296(x1), r1=129(y1), r2=92(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 129
LDI r2, 92
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
