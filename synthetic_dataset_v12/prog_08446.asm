; DESCRIPTION: Places a cyan line segment connecting (459, 120) to (335, 200).
; PLAN: r0=459(x1), r1=120(y1), r2=335(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 120
LDI r2, 335
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
