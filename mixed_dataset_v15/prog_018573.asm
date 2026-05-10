; DESCRIPTION: Places a white line segment connecting (367, 69) to (66, 88).
; PLAN: r0=367(x1), r1=69(y1), r2=66(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 69
LDI r2, 66
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
