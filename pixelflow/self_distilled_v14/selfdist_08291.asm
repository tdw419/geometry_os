; DESCRIPTION: Renders a white line segment connecting (370, 189) to (178, 126).
; PLAN: r0=370(x1), r1=189(y1), r2=178(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 189
LDI r2, 178
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
