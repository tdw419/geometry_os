; DESCRIPTION: Renders a white line between points (287, 209) and (437, 45).
; PLAN: r0=287(x1), r1=209(y1), r2=437(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 209
LDI r2, 437
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
