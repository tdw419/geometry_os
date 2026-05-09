; DESCRIPTION: Renders a red line between points (255, 145) and (156, 46).
; PLAN: r0=255(x1), r1=145(y1), r2=156(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 145
LDI r2, 156
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
