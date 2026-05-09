; DESCRIPTION: Renders a yellow line between points (239, 6) and (45, 162).
; PLAN: r0=239(x1), r1=6(y1), r2=45(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 6
LDI r2, 45
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
