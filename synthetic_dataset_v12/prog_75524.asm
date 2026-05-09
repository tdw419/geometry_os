; DESCRIPTION: Places a white line segment connecting (321, 130) to (438, 32).
; PLAN: r0=321(x1), r1=130(y1), r2=438(x2), r3=32(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 130
LDI r2, 438
LDI r3, 32
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
