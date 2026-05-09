; DESCRIPTION: Renders a white line between points (241, 236) and (39, 88).
; PLAN: r0=241(x1), r1=236(y1), r2=39(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 236
LDI r2, 39
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
