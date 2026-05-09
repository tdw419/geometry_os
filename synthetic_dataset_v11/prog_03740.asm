; DESCRIPTION: Renders a white line between points (141, 140) and (8, 242).
; PLAN: r0=141(x1), r1=140(y1), r2=8(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 140
LDI r2, 8
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
