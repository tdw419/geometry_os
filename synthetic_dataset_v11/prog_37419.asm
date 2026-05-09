; DESCRIPTION: Renders a red line between points (47, 164) and (108, 203).
; PLAN: r0=47(x1), r1=164(y1), r2=108(x2), r3=203(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 164
LDI r2, 108
LDI r3, 203
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
