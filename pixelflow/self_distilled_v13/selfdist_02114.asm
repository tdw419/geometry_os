; DESCRIPTION: Renders a yellow line segment connecting (295, 64) to (52, 122).
; PLAN: r0=295(x1), r1=64(y1), r2=52(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 64
LDI r2, 52
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
