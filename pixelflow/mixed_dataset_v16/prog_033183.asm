; DESCRIPTION: Renders a white line segment connecting (250, 119) to (182, 42).
; PLAN: r0=250(x1), r1=119(y1), r2=182(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 119
LDI r2, 182
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
