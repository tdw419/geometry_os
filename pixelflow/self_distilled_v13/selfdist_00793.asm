; DESCRIPTION: Renders a green line segment connecting (295, 145) to (240, 11).
; PLAN: r0=295(x1), r1=145(y1), r2=240(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 145
LDI r2, 240
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
