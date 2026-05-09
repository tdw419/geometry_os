; DESCRIPTION: Draws a yellow line from (219, 52) to (358, 125).
; PLAN: r0=219(x1), r1=52(y1), r2=358(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 52
LDI r2, 358
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
