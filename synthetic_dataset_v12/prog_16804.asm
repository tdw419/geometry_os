; DESCRIPTION: Renders a white line between points (294, 93) and (270, 24).
; PLAN: r0=294(x1), r1=93(y1), r2=270(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 93
LDI r2, 270
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
