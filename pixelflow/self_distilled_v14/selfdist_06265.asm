; DESCRIPTION: Renders a white line segment connecting (70, 9) to (373, 82).
; PLAN: r0=70(x1), r1=9(y1), r2=373(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 9
LDI r2, 373
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
