; DESCRIPTION: Renders a white line between points (220, 238) and (417, 68).
; PLAN: r0=220(x1), r1=238(y1), r2=417(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 238
LDI r2, 417
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
