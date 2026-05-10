; DESCRIPTION: Renders a white line between points (31, 42) and (65, 136).
; PLAN: r0=31(x1), r1=42(y1), r2=65(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 42
LDI r2, 65
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
