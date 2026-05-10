; DESCRIPTION: Renders a red line segment connecting (285, 73) to (117, 28).
; PLAN: r0=285(x1), r1=73(y1), r2=117(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 73
LDI r2, 117
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
