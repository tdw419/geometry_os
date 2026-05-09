; DESCRIPTION: Renders a red line between points (156, 255) and (255, 156).
; PLAN: r0=156(x1), r1=255(y1), r2=255(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 255
LDI r2, 255
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
