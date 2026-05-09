; DESCRIPTION: Places a white line segment connecting (174, 68) to (69, 22).
; PLAN: r0=174(x1), r1=68(y1), r2=69(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 68
LDI r2, 69
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
