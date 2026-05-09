; DESCRIPTION: Places a white line segment connecting (491, 46) to (358, 64).
; PLAN: r0=491(x1), r1=46(y1), r2=358(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 46
LDI r2, 358
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
