; DESCRIPTION: Places a red line segment connecting (234, 152) to (459, 190).
; PLAN: r0=234(x1), r1=152(y1), r2=459(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 152
LDI r2, 459
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
