; DESCRIPTION: Renders a green line segment connecting (135, 125) to (398, 3).
; PLAN: r0=135(x1), r1=125(y1), r2=398(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 125
LDI r2, 398
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
