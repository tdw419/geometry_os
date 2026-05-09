; DESCRIPTION: Renders a red line between points (81, 111) and (187, 199).
; PLAN: r0=81(x1), r1=111(y1), r2=187(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 111
LDI r2, 187
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
