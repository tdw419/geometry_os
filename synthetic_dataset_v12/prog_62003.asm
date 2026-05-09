; DESCRIPTION: Renders a yellow line between points (70, 150) and (258, 199).
; PLAN: r0=70(x1), r1=150(y1), r2=258(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 150
LDI r2, 258
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
