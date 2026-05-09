; DESCRIPTION: Places a white line segment connecting (467, 202) to (133, 200).
; PLAN: r0=467(x1), r1=202(y1), r2=133(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 202
LDI r2, 133
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
