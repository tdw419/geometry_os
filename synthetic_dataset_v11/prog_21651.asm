; DESCRIPTION: Places a white line segment connecting (241, 70) to (195, 91).
; PLAN: r0=241(x1), r1=70(y1), r2=195(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 70
LDI r2, 195
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
