; DESCRIPTION: Places a white line segment connecting (126, 199) to (290, 220).
; PLAN: r0=126(x1), r1=199(y1), r2=290(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 199
LDI r2, 290
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
