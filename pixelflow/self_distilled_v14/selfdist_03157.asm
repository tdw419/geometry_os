; DESCRIPTION: Renders a yellow line segment connecting (0, 19) to (254, 190).
; PLAN: r0=0(x1), r1=19(y1), r2=254(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 19
LDI r2, 254
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
