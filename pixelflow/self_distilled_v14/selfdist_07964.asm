; DESCRIPTION: Renders a green line segment connecting (259, 142) to (166, 186).
; PLAN: r0=259(x1), r1=142(y1), r2=166(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 142
LDI r2, 166
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
