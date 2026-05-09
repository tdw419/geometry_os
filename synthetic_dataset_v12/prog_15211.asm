; DESCRIPTION: Places a magenta line segment connecting (310, 69) to (130, 16).
; PLAN: r0=310(x1), r1=69(y1), r2=130(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 69
LDI r2, 130
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
