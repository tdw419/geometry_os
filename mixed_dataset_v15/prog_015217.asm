; DESCRIPTION: Draws a red line from (275, 181) to (20, 214).
; PLAN: r0=275(x1), r1=181(y1), r2=20(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 181
LDI r2, 20
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
