; DESCRIPTION: Renders a green line between points (29, 221) and (217, 140).
; PLAN: r0=29(x1), r1=221(y1), r2=217(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 221
LDI r2, 217
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
