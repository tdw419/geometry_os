; DESCRIPTION: Places a red line segment connecting (268, 234) to (91, 186).
; PLAN: r0=268(x1), r1=234(y1), r2=91(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 234
LDI r2, 91
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
