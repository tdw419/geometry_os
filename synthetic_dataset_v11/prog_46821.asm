; DESCRIPTION: Places a red line segment connecting (73, 35) to (178, 196).
; PLAN: r0=73(x1), r1=35(y1), r2=178(x2), r3=196(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 35
LDI r2, 178
LDI r3, 196
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
