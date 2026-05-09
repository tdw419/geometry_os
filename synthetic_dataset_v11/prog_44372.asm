; DESCRIPTION: Renders a red line between points (150, 127) and (108, 245).
; PLAN: r0=150(x1), r1=127(y1), r2=108(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 127
LDI r2, 108
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
