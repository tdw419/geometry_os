; DESCRIPTION: Draws a yellow line from (186, 113) to (196, 189).
; PLAN: r0=186(x1), r1=113(y1), r2=196(x2), r3=189(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 113
LDI r2, 196
LDI r3, 189
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
