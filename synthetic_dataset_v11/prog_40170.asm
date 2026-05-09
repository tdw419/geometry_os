; DESCRIPTION: Places a red line segment connecting (171, 214) to (204, 159).
; PLAN: r0=171(x1), r1=214(y1), r2=204(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 214
LDI r2, 204
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
