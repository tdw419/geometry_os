; DESCRIPTION: Places a green line segment connecting (179, 171) to (5, 69).
; PLAN: r0=179(x1), r1=171(y1), r2=5(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 171
LDI r2, 5
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
