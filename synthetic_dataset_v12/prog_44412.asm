; DESCRIPTION: Places a red line segment connecting (427, 146) to (171, 142).
; PLAN: r0=427(x1), r1=146(y1), r2=171(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 146
LDI r2, 171
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
