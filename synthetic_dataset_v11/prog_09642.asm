; DESCRIPTION: Places a white line segment connecting (90, 81) to (239, 233).
; PLAN: r0=90(x1), r1=81(y1), r2=239(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 81
LDI r2, 239
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
