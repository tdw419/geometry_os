; DESCRIPTION: Renders a red line between points (346, 199) and (241, 188).
; PLAN: r0=346(x1), r1=199(y1), r2=241(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 199
LDI r2, 241
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
