; DESCRIPTION: Places a red line segment connecting (3, 151) to (275, 86).
; PLAN: r0=3(x1), r1=151(y1), r2=275(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 151
LDI r2, 275
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
