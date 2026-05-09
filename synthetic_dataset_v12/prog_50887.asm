; DESCRIPTION: Renders a white line between points (242, 50) and (106, 85).
; PLAN: r0=242(x1), r1=50(y1), r2=106(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 50
LDI r2, 106
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
