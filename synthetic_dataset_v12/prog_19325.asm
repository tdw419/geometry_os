; DESCRIPTION: Places a green line segment connecting (170, 130) to (103, 81).
; PLAN: r0=170(x1), r1=130(y1), r2=103(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 130
LDI r2, 103
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
