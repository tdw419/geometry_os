; DESCRIPTION: Renders a white line between points (317, 64) and (37, 136).
; PLAN: r0=317(x1), r1=64(y1), r2=37(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 64
LDI r2, 37
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
