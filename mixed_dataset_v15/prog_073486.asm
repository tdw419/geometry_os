; DESCRIPTION: Renders a red line segment connecting (350, 122) to (272, 109).
; PLAN: r0=350(x1), r1=122(y1), r2=272(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 122
LDI r2, 272
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
