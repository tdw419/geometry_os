; DESCRIPTION: Renders a green line between points (351, 103) and (391, 214).
; PLAN: r0=351(x1), r1=103(y1), r2=391(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 103
LDI r2, 391
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
