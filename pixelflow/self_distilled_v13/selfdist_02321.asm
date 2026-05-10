; DESCRIPTION: Renders a cyan line segment connecting (142, 6) to (381, 73).
; PLAN: r0=142(x1), r1=6(y1), r2=381(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 6
LDI r2, 381
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
