; DESCRIPTION: Renders a green line segment connecting (324, 70) to (107, 12).
; PLAN: r0=324(x1), r1=70(y1), r2=107(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 70
LDI r2, 107
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
