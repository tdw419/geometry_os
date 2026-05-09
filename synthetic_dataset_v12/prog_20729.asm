; DESCRIPTION: Places a white line segment connecting (85, 164) to (290, 192).
; PLAN: r0=85(x1), r1=164(y1), r2=290(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 164
LDI r2, 290
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
