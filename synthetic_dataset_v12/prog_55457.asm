; DESCRIPTION: Places a white line segment connecting (174, 190) to (183, 74).
; PLAN: r0=174(x1), r1=190(y1), r2=183(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 190
LDI r2, 183
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
