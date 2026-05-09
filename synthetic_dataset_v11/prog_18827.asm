; DESCRIPTION: Renders a orange line between points (192, 242) and (17, 160).
; PLAN: r0=192(x1), r1=242(y1), r2=17(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 242
LDI r2, 17
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
