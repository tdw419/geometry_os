; DESCRIPTION: Renders a red line between points (193, 43) and (21, 174).
; PLAN: r0=193(x1), r1=43(y1), r2=21(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 43
LDI r2, 21
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
