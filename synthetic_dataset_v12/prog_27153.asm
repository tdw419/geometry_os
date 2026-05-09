; DESCRIPTION: Renders a white line between points (446, 217) and (329, 102).
; PLAN: r0=446(x1), r1=217(y1), r2=329(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 217
LDI r2, 329
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
