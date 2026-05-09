; DESCRIPTION: Places a white line segment connecting (152, 199) to (195, 72).
; PLAN: r0=152(x1), r1=199(y1), r2=195(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 199
LDI r2, 195
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
