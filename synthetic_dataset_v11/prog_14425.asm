; DESCRIPTION: Places a cyan line segment connecting (22, 35) to (207, 130).
; PLAN: r0=22(x1), r1=35(y1), r2=207(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 35
LDI r2, 207
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
