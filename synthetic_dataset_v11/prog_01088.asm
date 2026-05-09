; DESCRIPTION: Renders a cyan line between points (246, 241) and (169, 207).
; PLAN: r0=246(x1), r1=241(y1), r2=169(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 241
LDI r2, 169
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
