; DESCRIPTION: Renders a white line between points (19, 46) and (180, 137).
; PLAN: r0=19(x1), r1=46(y1), r2=180(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 46
LDI r2, 180
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
