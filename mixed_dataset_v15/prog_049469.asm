; DESCRIPTION: Renders a yellow line segment connecting (242, 23) to (103, 39).
; PLAN: r0=242(x1), r1=23(y1), r2=103(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 23
LDI r2, 103
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
