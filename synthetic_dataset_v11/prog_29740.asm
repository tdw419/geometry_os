; DESCRIPTION: Places a green line segment connecting (242, 130) to (63, 248).
; PLAN: r0=242(x1), r1=130(y1), r2=63(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 130
LDI r2, 63
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
