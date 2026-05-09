; DESCRIPTION: Places a white line segment connecting (34, 86) to (220, 126).
; PLAN: r0=34(x1), r1=86(y1), r2=220(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 86
LDI r2, 220
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
