; DESCRIPTION: Draws a yellow line from (145, 111) to (298, 10).
; PLAN: r0=145(x1), r1=111(y1), r2=298(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 111
LDI r2, 298
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
