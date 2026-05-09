; DESCRIPTION: Draws a yellow line from (340, 222) to (184, 77).
; PLAN: r0=340(x1), r1=222(y1), r2=184(x2), r3=77(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 222
LDI r2, 184
LDI r3, 77
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
