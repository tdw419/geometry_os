; DESCRIPTION: Renders a green line between points (38, 183) and (251, 255).
; PLAN: r0=38(x1), r1=183(y1), r2=251(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 183
LDI r2, 251
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
