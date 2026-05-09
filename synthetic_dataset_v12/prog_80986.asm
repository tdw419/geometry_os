; DESCRIPTION: Places a red line segment connecting (290, 151) to (353, 229).
; PLAN: r0=290(x1), r1=151(y1), r2=353(x2), r3=229(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 151
LDI r2, 353
LDI r3, 229
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
