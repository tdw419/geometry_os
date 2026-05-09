; DESCRIPTION: Renders a red line between points (177, 167) and (197, 98).
; PLAN: r0=177(x1), r1=167(y1), r2=197(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 167
LDI r2, 197
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
