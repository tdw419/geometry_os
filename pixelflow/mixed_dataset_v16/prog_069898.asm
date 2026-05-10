; DESCRIPTION: Renders a white line between points (210, 53) and (338, 181).
; PLAN: r0=210(x1), r1=53(y1), r2=338(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 53
LDI r2, 338
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
