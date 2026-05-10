; DESCRIPTION: Renders a green line segment connecting (313, 60) to (180, 185).
; PLAN: r0=313(x1), r1=60(y1), r2=180(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 60
LDI r2, 180
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
