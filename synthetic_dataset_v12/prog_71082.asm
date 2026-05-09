; DESCRIPTION: Places a white line segment connecting (48, 75) to (358, 240).
; PLAN: r0=48(x1), r1=75(y1), r2=358(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 75
LDI r2, 358
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
