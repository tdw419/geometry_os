; DESCRIPTION: Renders a white line between points (304, 230) and (3, 246).
; PLAN: r0=304(x1), r1=230(y1), r2=3(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 230
LDI r2, 3
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
