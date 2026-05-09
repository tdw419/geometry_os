; DESCRIPTION: Renders a green line between points (222, 107) and (162, 45).
; PLAN: r0=222(x1), r1=107(y1), r2=162(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 107
LDI r2, 162
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
