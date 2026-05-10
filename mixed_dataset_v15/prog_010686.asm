; DESCRIPTION: Renders a white line segment connecting (317, 4) to (127, 3).
; PLAN: r0=317(x1), r1=4(y1), r2=127(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 4
LDI r2, 127
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
