; DESCRIPTION: Renders a red line between points (113, 107) and (38, 172).
; PLAN: r0=113(x1), r1=107(y1), r2=38(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 107
LDI r2, 38
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
