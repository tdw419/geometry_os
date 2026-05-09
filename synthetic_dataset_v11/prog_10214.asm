; DESCRIPTION: Renders a white line between points (55, 40) and (0, 240).
; PLAN: r0=55(x1), r1=40(y1), r2=0(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 40
LDI r2, 0
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
