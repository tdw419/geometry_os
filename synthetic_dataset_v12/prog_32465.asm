; DESCRIPTION: Places a white line segment connecting (182, 190) to (265, 249).
; PLAN: r0=182(x1), r1=190(y1), r2=265(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 190
LDI r2, 265
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
