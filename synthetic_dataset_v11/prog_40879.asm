; DESCRIPTION: Places a yellow line segment connecting (242, 130) to (241, 141).
; PLAN: r0=242(x1), r1=130(y1), r2=241(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 130
LDI r2, 241
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
