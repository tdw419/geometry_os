; DESCRIPTION: Renders a red line between points (82, 73) and (8, 187).
; PLAN: r0=82(x1), r1=73(y1), r2=8(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 73
LDI r2, 8
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
