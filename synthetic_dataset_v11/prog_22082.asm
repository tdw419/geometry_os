; DESCRIPTION: Renders a green line between points (176, 39) and (185, 204).
; PLAN: r0=176(x1), r1=39(y1), r2=185(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 39
LDI r2, 185
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
