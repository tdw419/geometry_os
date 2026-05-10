; DESCRIPTION: Draws a red line from (209, 75) to (407, 214).
; PLAN: r0=209(x1), r1=75(y1), r2=407(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 75
LDI r2, 407
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
