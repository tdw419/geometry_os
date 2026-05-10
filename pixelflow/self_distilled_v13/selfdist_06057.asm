; DESCRIPTION: Renders a green line segment connecting (143, 188) to (195, 140).
; PLAN: r0=143(x1), r1=188(y1), r2=195(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 188
LDI r2, 195
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
