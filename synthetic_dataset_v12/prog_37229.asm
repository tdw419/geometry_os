; DESCRIPTION: Places a green line segment connecting (260, 135) to (475, 183).
; PLAN: r0=260(x1), r1=135(y1), r2=475(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 135
LDI r2, 475
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
