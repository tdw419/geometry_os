; DESCRIPTION: Places a white line segment connecting (75, 106) to (130, 255).
; PLAN: r0=75(x1), r1=106(y1), r2=130(x2), r3=255(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 106
LDI r2, 130
LDI r3, 255
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
