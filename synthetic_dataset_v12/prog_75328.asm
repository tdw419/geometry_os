; DESCRIPTION: Places a yellow line segment connecting (111, 176) to (481, 78).
; PLAN: r0=111(x1), r1=176(y1), r2=481(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 176
LDI r2, 481
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
