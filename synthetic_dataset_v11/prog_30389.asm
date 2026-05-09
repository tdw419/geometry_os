; DESCRIPTION: Renders a green line between points (247, 146) and (139, 255).
; PLAN: r0=247(x1), r1=146(y1), r2=139(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 146
LDI r2, 139
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
