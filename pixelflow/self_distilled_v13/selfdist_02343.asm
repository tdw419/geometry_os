; DESCRIPTION: Renders a white line segment connecting (187, 21) to (17, 82).
; PLAN: r0=187(x1), r1=21(y1), r2=17(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 21
LDI r2, 17
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
