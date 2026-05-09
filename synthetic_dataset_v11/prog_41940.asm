; DESCRIPTION: Renders a white line between points (17, 247) and (69, 140).
; PLAN: r0=17(x1), r1=247(y1), r2=69(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 247
LDI r2, 69
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
