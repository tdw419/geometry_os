; DESCRIPTION: Places a white line segment connecting (502, 135) to (447, 205).
; PLAN: r0=502(x1), r1=135(y1), r2=447(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 135
LDI r2, 447
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
