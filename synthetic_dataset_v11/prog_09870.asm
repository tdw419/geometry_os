; DESCRIPTION: Places a white line segment connecting (195, 138) to (66, 123).
; PLAN: r0=195(x1), r1=138(y1), r2=66(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 138
LDI r2, 66
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
