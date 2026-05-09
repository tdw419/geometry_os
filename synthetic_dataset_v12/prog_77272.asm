; DESCRIPTION: Draws a red line from (407, 220) to (332, 72).
; PLAN: r0=407(x1), r1=220(y1), r2=332(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 220
LDI r2, 332
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
