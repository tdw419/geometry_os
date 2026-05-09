; DESCRIPTION: Renders a white line between points (266, 173) and (463, 89).
; PLAN: r0=266(x1), r1=173(y1), r2=463(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 173
LDI r2, 463
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
