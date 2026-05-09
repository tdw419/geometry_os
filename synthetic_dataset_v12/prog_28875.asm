; DESCRIPTION: Renders a white line between points (466, 132) and (298, 102).
; PLAN: r0=466(x1), r1=132(y1), r2=298(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 132
LDI r2, 298
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
