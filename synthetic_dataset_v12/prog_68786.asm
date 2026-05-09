; DESCRIPTION: Renders a white line between points (297, 238) and (127, 144).
; PLAN: r0=297(x1), r1=238(y1), r2=127(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 238
LDI r2, 127
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
