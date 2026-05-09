; DESCRIPTION: Places a red line segment connecting (198, 30) to (306, 234).
; PLAN: r0=198(x1), r1=30(y1), r2=306(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 30
LDI r2, 306
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
