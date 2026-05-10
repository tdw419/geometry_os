; DESCRIPTION: Renders a red line between points (430, 21) and (447, 187).
; PLAN: r0=430(x1), r1=21(y1), r2=447(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 21
LDI r2, 447
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
