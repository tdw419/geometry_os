; DESCRIPTION: Places a white line segment connecting (61, 151) to (7, 202).
; PLAN: r0=61(x1), r1=151(y1), r2=7(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 151
LDI r2, 7
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
