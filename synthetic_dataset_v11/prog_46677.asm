; DESCRIPTION: Places a green line segment connecting (75, 97) to (35, 206).
; PLAN: r0=75(x1), r1=97(y1), r2=35(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 97
LDI r2, 35
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
