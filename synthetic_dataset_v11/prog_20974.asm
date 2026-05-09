; DESCRIPTION: Renders a white line between points (138, 236) and (204, 177).
; PLAN: r0=138(x1), r1=236(y1), r2=204(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 236
LDI r2, 204
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
