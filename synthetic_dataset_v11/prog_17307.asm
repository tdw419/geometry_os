; DESCRIPTION: Renders a cyan line between points (29, 241) and (246, 207).
; PLAN: r0=29(x1), r1=241(y1), r2=246(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 241
LDI r2, 246
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
