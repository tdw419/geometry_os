; DESCRIPTION: Draws a red line from (334, 171) to (493, 191).
; PLAN: r0=334(x1), r1=171(y1), r2=493(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 171
LDI r2, 493
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
