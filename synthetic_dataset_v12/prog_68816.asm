; DESCRIPTION: Places a red line segment connecting (213, 165) to (430, 112).
; PLAN: r0=213(x1), r1=165(y1), r2=430(x2), r3=112(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 165
LDI r2, 430
LDI r3, 112
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
