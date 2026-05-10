; DESCRIPTION: Renders a red line between points (462, 215) and (408, 187).
; PLAN: r0=462(x1), r1=215(y1), r2=408(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 215
LDI r2, 408
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
