; DESCRIPTION: Places a red line segment connecting (229, 39) to (230, 52).
; PLAN: r0=229(x1), r1=39(y1), r2=230(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 39
LDI r2, 230
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
