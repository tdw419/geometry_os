; DESCRIPTION: Places a green line segment connecting (91, 69) to (66, 206).
; PLAN: r0=91(x1), r1=69(y1), r2=66(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 69
LDI r2, 66
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
