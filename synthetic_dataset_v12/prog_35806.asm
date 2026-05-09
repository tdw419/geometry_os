; DESCRIPTION: Renders a cyan line between points (350, 222) and (158, 130).
; PLAN: r0=350(x1), r1=222(y1), r2=158(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 222
LDI r2, 158
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
