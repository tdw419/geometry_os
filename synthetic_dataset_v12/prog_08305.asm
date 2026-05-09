; DESCRIPTION: Renders a white line between points (423, 45) and (16, 165).
; PLAN: r0=423(x1), r1=45(y1), r2=16(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 45
LDI r2, 16
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
