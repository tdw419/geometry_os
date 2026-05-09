; DESCRIPTION: Renders a white line between points (418, 248) and (246, 13).
; PLAN: r0=418(x1), r1=248(y1), r2=246(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 248
LDI r2, 246
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
