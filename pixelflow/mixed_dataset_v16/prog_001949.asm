; DESCRIPTION: Renders a yellow line segment connecting (82, 18) to (254, 175).
; PLAN: r0=82(x1), r1=18(y1), r2=254(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 18
LDI r2, 254
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
