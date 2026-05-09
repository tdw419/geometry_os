; DESCRIPTION: Places a white line segment connecting (410, 32) to (251, 17).
; PLAN: r0=410(x1), r1=32(y1), r2=251(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 32
LDI r2, 251
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
