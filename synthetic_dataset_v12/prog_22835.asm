; DESCRIPTION: Renders a white line between points (256, 1) and (53, 66).
; PLAN: r0=256(x1), r1=1(y1), r2=53(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 1
LDI r2, 53
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
