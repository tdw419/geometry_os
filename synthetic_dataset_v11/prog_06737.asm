; DESCRIPTION: Places a green line segment connecting (49, 54) to (66, 87).
; PLAN: r0=49(x1), r1=54(y1), r2=66(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 54
LDI r2, 66
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
