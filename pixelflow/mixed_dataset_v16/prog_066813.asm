; DESCRIPTION: Places a white line segment connecting (189, 229) to (73, 190).
; PLAN: r0=189(x1), r1=229(y1), r2=73(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 229
LDI r2, 73
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
