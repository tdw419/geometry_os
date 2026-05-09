; DESCRIPTION: Draws a yellow line from (348, 33) to (125, 221).
; PLAN: r0=348(x1), r1=33(y1), r2=125(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 33
LDI r2, 125
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
