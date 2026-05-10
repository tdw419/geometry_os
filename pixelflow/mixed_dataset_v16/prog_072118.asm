; DESCRIPTION: Places a green line segment connecting (44, 151) to (505, 159).
; PLAN: r0=44(x1), r1=151(y1), r2=505(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 151
LDI r2, 505
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
