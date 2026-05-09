; DESCRIPTION: Places a red line segment connecting (252, 197) to (125, 54).
; PLAN: r0=252(x1), r1=197(y1), r2=125(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 197
LDI r2, 125
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
