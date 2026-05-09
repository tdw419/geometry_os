; DESCRIPTION: Renders a red line between points (50, 40) and (62, 174).
; PLAN: r0=50(x1), r1=40(y1), r2=62(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 40
LDI r2, 62
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
