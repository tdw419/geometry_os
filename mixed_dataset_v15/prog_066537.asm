; DESCRIPTION: Places a green line segment connecting (18, 69) to (177, 140).
; PLAN: r0=18(x1), r1=69(y1), r2=177(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 69
LDI r2, 177
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
