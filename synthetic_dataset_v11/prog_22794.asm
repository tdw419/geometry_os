; DESCRIPTION: Renders a white line between points (183, 115) and (225, 234).
; PLAN: r0=183(x1), r1=115(y1), r2=225(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 115
LDI r2, 225
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
