; DESCRIPTION: Renders a yellow line segment connecting (223, 16) to (207, 194).
; PLAN: r0=223(x1), r1=16(y1), r2=207(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 16
LDI r2, 207
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
