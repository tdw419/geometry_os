; DESCRIPTION: Places a yellow line segment connecting (109, 20) to (167, 46).
; PLAN: r0=109(x1), r1=20(y1), r2=167(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 20
LDI r2, 167
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
