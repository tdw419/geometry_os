; DESCRIPTION: Places a red line segment connecting (178, 171) to (207, 234).
; PLAN: r0=178(x1), r1=171(y1), r2=207(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 171
LDI r2, 207
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
