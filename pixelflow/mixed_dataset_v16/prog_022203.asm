; DESCRIPTION: Places a green line segment connecting (271, 159) to (33, 33).
; PLAN: r0=271(x1), r1=159(y1), r2=33(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 159
LDI r2, 33
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
