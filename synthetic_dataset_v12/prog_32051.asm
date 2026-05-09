; DESCRIPTION: Renders a red line between points (408, 107) and (508, 91).
; PLAN: r0=408(x1), r1=107(y1), r2=508(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 107
LDI r2, 508
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
