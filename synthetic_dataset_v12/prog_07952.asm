; DESCRIPTION: Places a red line segment connecting (509, 147) to (292, 187).
; PLAN: r0=509(x1), r1=147(y1), r2=292(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 147
LDI r2, 292
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
