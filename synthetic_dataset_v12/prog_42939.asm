; DESCRIPTION: Places a red line segment connecting (502, 237) to (200, 77).
; PLAN: r0=502(x1), r1=237(y1), r2=200(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 237
LDI r2, 200
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
