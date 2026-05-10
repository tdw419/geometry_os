; DESCRIPTION: Renders a yellow line segment connecting (332, 144) to (242, 187).
; PLAN: r0=332(x1), r1=144(y1), r2=242(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 144
LDI r2, 242
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
