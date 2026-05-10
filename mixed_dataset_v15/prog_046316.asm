; DESCRIPTION: Renders a white line segment connecting (111, 66) to (299, 18).
; PLAN: r0=111(x1), r1=66(y1), r2=299(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 66
LDI r2, 299
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
