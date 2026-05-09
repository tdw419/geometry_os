; DESCRIPTION: Places a red line segment connecting (214, 174) to (107, 159).
; PLAN: r0=214(x1), r1=174(y1), r2=107(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 174
LDI r2, 107
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
