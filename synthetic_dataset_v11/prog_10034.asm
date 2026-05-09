; DESCRIPTION: Renders a green line between points (178, 69) and (97, 44).
; PLAN: r0=178(x1), r1=69(y1), r2=97(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 69
LDI r2, 97
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
