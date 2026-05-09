; DESCRIPTION: Renders a white line between points (266, 216) and (202, 50).
; PLAN: r0=266(x1), r1=216(y1), r2=202(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 216
LDI r2, 202
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
