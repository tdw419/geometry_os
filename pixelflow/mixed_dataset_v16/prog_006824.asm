; DESCRIPTION: Renders a red line between points (499, 195) and (299, 106).
; PLAN: r0=499(x1), r1=195(y1), r2=299(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 195
LDI r2, 299
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
