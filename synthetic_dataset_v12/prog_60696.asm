; DESCRIPTION: Renders a red line between points (61, 255) and (50, 114).
; PLAN: r0=61(x1), r1=255(y1), r2=50(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 255
LDI r2, 50
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
