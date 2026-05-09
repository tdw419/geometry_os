; DESCRIPTION: Renders a white line between points (411, 107) and (166, 89).
; PLAN: r0=411(x1), r1=107(y1), r2=166(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 107
LDI r2, 166
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
