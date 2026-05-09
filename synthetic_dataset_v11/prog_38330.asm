; DESCRIPTION: Composite: . Then Renders a yellow line between points (135, 44) and (220, 147). Then Places a blue dot at position (162, 189).
; PLAN: r0=135(x1), r1=44(y1), r2=220(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=162(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (135, 44) and (220, 147).
; PLAN: r0=135(x1), r1=44(y1), r2=220(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 44
LDI r2, 220
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (162, 189).
; PLAN: r0=162(x), r1=189(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 189
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
