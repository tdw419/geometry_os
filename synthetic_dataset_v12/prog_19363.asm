; DESCRIPTION: Places a red line segment connecting (157, 173) to (193, 190).
; PLAN: r0=157(x1), r1=173(y1), r2=193(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 173
LDI r2, 193
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
