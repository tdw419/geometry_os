; DESCRIPTION: Renders a white line between points (11, 35) and (48, 47).
; PLAN: r0=11(x1), r1=35(y1), r2=48(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 35
LDI r2, 48
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
