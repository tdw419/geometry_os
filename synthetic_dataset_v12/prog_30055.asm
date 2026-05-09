; DESCRIPTION: Places a white line segment connecting (312, 179) to (502, 196).
; PLAN: r0=312(x1), r1=179(y1), r2=502(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 179
LDI r2, 502
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
