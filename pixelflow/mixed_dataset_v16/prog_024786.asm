; DESCRIPTION: Renders a white line segment connecting (168, 99) to (378, 11).
; PLAN: r0=168(x1), r1=99(y1), r2=378(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 99
LDI r2, 378
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
