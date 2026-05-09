; DESCRIPTION: Places a green line segment connecting (54, 77) to (209, 130).
; PLAN: r0=54(x1), r1=77(y1), r2=209(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 77
LDI r2, 209
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
