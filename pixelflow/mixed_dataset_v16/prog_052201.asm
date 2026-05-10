; DESCRIPTION: Places a red line segment connecting (178, 61) to (283, 168).
; PLAN: r0=178(x1), r1=61(y1), r2=283(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 61
LDI r2, 283
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
