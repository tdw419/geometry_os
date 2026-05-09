; DESCRIPTION: Places a white line segment connecting (75, 220) to (75, 240).
; PLAN: r0=75(x1), r1=220(y1), r2=75(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 220
LDI r2, 75
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
