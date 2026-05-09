; DESCRIPTION: Renders a white line between points (300, 157) and (195, 208).
; PLAN: r0=300(x1), r1=157(y1), r2=195(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 157
LDI r2, 195
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
