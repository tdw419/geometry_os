; DESCRIPTION: Renders a yellow line between points (375, 242) and (67, 211).
; PLAN: r0=375(x1), r1=242(y1), r2=67(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 242
LDI r2, 67
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
