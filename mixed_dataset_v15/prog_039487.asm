; DESCRIPTION: Places a green line segment connecting (33, 225) to (159, 83).
; PLAN: r0=33(x1), r1=225(y1), r2=159(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 225
LDI r2, 159
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
