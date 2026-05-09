; DESCRIPTION: Renders a green line between points (341, 176) and (228, 96).
; PLAN: r0=341(x1), r1=176(y1), r2=228(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 176
LDI r2, 228
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
