; DESCRIPTION: Renders a red line between points (122, 65) and (171, 188).
; PLAN: r0=122(x1), r1=65(y1), r2=171(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 65
LDI r2, 171
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
