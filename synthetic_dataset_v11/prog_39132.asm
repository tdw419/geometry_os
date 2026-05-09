; DESCRIPTION: Renders a white line between points (250, 247) and (48, 69).
; PLAN: r0=250(x1), r1=247(y1), r2=48(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 247
LDI r2, 48
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
