; DESCRIPTION: Places a green line segment connecting (190, 150) to (183, 202).
; PLAN: r0=190(x1), r1=150(y1), r2=183(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 150
LDI r2, 183
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
