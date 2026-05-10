; DESCRIPTION: Renders a white line between points (178, 93) and (153, 8).
; PLAN: r0=178(x1), r1=93(y1), r2=153(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 93
LDI r2, 153
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
