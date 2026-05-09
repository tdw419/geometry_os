; DESCRIPTION: Draws a yellow line from (81, 7) to (36, 125).
; PLAN: r0=81(x1), r1=7(y1), r2=36(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 7
LDI r2, 36
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
