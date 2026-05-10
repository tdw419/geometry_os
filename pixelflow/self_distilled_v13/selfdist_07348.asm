; DESCRIPTION: Draws a red line from (52, 100) to (17, 103).
; PLAN: r0=52(x1), r1=100(y1), r2=17(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 100
LDI r2, 17
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
