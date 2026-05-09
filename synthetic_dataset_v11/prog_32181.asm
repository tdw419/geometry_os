; DESCRIPTION: Draws a red line from (171, 103) to (40, 214).
; PLAN: r0=171(x1), r1=103(y1), r2=40(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 103
LDI r2, 40
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
