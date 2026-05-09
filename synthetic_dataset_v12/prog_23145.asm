; DESCRIPTION: Draws a yellow line from (239, 123) to (233, 180).
; PLAN: r0=239(x1), r1=123(y1), r2=233(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 123
LDI r2, 233
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
