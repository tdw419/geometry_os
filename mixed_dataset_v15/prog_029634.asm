; DESCRIPTION: Renders a red line segment connecting (391, 132) to (53, 59).
; PLAN: r0=391(x1), r1=132(y1), r2=53(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 132
LDI r2, 53
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
