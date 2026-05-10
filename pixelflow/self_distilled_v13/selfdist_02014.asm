; DESCRIPTION: Renders a yellow line segment connecting (113, 151) to (222, 39).
; PLAN: r0=113(x1), r1=151(y1), r2=222(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 151
LDI r2, 222
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
