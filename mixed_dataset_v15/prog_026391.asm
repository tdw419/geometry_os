; DESCRIPTION: Places a green line segment connecting (9, 69) to (65, 50).
; PLAN: r0=9(x1), r1=69(y1), r2=65(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 69
LDI r2, 65
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
