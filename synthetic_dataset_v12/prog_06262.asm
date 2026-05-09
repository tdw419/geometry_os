; DESCRIPTION: Renders a green line between points (443, 118) and (495, 242).
; PLAN: r0=443(x1), r1=118(y1), r2=495(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 118
LDI r2, 495
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
