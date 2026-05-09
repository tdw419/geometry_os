; DESCRIPTION: Renders a green line between points (157, 183) and (1, 68).
; PLAN: r0=157(x1), r1=183(y1), r2=1(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 183
LDI r2, 1
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
