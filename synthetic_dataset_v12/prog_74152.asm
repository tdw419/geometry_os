; DESCRIPTION: Places a green line segment connecting (499, 141) to (21, 100).
; PLAN: r0=499(x1), r1=141(y1), r2=21(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 141
LDI r2, 21
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
