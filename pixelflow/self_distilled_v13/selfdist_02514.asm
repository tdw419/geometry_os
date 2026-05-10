; DESCRIPTION: Renders a white line segment connecting (283, 182) to (13, 180).
; PLAN: r0=283(x1), r1=182(y1), r2=13(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 182
LDI r2, 13
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
