; DESCRIPTION: Places a red line segment connecting (265, 73) to (19, 58).
; PLAN: r0=265(x1), r1=73(y1), r2=19(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 73
LDI r2, 19
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
