; DESCRIPTION: Renders a white line between points (205, 211) and (141, 150).
; PLAN: r0=205(x1), r1=211(y1), r2=141(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 211
LDI r2, 141
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
