; DESCRIPTION: Renders a white line between points (336, 53) and (191, 195).
; PLAN: r0=336(x1), r1=53(y1), r2=191(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 53
LDI r2, 191
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
