; DESCRIPTION: Renders a white line between points (247, 151) and (37, 74).
; PLAN: r0=247(x1), r1=151(y1), r2=37(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 151
LDI r2, 37
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
