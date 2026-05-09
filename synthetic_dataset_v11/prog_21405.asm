; DESCRIPTION: Renders a white line between points (195, 168) and (220, 157).
; PLAN: r0=195(x1), r1=168(y1), r2=220(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 168
LDI r2, 220
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
