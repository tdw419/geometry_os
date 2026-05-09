; DESCRIPTION: Renders a blue line between points (104, 207) and (242, 170).
; PLAN: r0=104(x1), r1=207(y1), r2=242(x2), r3=170(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 207
LDI r2, 242
LDI r3, 170
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
