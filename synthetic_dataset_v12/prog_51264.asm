; DESCRIPTION: Places a red line segment connecting (330, 226) to (178, 73).
; PLAN: r0=330(x1), r1=226(y1), r2=178(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 226
LDI r2, 178
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
