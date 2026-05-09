; DESCRIPTION: Renders a red line between points (499, 161) and (246, 195).
; PLAN: r0=499(x1), r1=161(y1), r2=246(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 161
LDI r2, 246
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
