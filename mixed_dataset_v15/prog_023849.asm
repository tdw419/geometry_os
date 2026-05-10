; DESCRIPTION: Renders a white line between points (286, 180) and (258, 73).
; PLAN: r0=286(x1), r1=180(y1), r2=258(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 180
LDI r2, 258
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
