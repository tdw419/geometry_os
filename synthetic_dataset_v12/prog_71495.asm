; DESCRIPTION: Places a white line segment connecting (400, 190) to (128, 135).
; PLAN: r0=400(x1), r1=190(y1), r2=128(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 190
LDI r2, 128
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
