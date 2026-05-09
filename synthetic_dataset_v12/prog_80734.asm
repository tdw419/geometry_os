; DESCRIPTION: Renders a white line between points (454, 166) and (121, 45).
; PLAN: r0=454(x1), r1=166(y1), r2=121(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 166
LDI r2, 121
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
