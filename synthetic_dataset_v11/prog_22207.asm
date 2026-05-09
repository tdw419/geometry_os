; DESCRIPTION: Renders a green line between points (157, 211) and (113, 30).
; PLAN: r0=157(x1), r1=211(y1), r2=113(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 211
LDI r2, 113
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
