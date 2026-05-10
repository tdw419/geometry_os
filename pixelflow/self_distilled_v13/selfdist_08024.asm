; DESCRIPTION: Renders a yellow line segment connecting (394, 95) to (333, 25).
; PLAN: r0=394(x1), r1=95(y1), r2=333(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 95
LDI r2, 333
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
