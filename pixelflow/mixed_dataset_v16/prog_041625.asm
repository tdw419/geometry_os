; DESCRIPTION: Renders a white line between points (354, 177) and (141, 102).
; PLAN: r0=354(x1), r1=177(y1), r2=141(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 177
LDI r2, 141
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
